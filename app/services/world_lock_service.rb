# http://redis.io/topics/transactions
class WorldLockService

  KEY = 'world_lock'

  def initialize
    @client = RedisService.connection
  end

  def lock value
    @client.watch(KEY) do
      locks = read_locks
      unless locks.include?(value)
        update_locks(locks << value)
        yield true
      else
        @client.unwatch
        yield false
      end
    end
  end

  def unlock value
    locks = read_locks
    locks.delete value
    update_locks locks
  end

  def clear
    @client.del(KEY)
  end

  private

  def read_locks
    value = @client.get(KEY)
    value ? JSON.parse(value) : []
  end

  def update_locks value
    @client.multi do |multi|
      multi.set(KEY, value)
    end
  end

end
