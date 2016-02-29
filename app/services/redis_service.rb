class RedisService

  def self.connection
    @connection ||= Redis.new
  end

  def self.connection_config
    # TODO
  end

end
