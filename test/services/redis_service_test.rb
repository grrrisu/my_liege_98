require 'test_helper'

class RedisServiceTest < ActiveSupport::TestCase

  test "write and read from redis" do
    client = RedisService.connection
    client.set('foo', 'bar')
    assert_equal 'bar', client.get('foo')
  end

end
