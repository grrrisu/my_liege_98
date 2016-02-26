require 'test_helper'

class Sim::TestData < Sim::Data

  properties :data_string, :data_float, :data_array, :data_hash

end


class SimDataTest < ActiveSupport::TestCase

  def setup
    @object = Sim::TestData.new(data_string: 'foo', data_float: 1.23, data_array: [4,5,6,7], data_hash: {a: 1, b: 2, c: 3})
  end

  test "should have readers" do
    assert_equal(@object.data_string, 'foo')
    assert_equal(@object.data_float, 1.23)
    assert_equal(@object.data_array, [4,5,6,7])
    assert_equal(@object.data_hash, {a: 1, b: 2, c: 3})
  end

  test "should have writers" do
    @object.data_string = 'bar'
    @object.data_float = 9.08
    @object.data_array = [41,51,61,71]
    @object.data_hash = {a: 12, b: 13, c: 14}

    assert_equal(@object.data_string, 'bar')
    assert_equal(@object.data_float, 9.08)
    assert_equal(@object.data_array, [41,51,61,71])
    assert_equal(@object.data_hash, {a: 12, b: 13, c: 14})
  end

  test "should save values" do
    @object.save!
    @object.reload
    assert_equal(@object.data_string, 'foo')
    assert_equal(@object.data_float, 1.23)
    assert_equal(@object.data_array, [4,5,6,7])
    # beware!! returns keys as strings
    assert_equal(@object.data_hash, {'a' => 1, 'b' => 2, 'c' => 3})
  end

  test "should create chidren" do
    child_1 = @object.children.build type: 'Sim::TestData', data_string: 'Child 1'
    child_2 = @object.children.build type: 'Sim::TestData', data_string: 'Child 2'
    @object.save!

    assert_equal(@object.reload.children.to_a, [child_1, child_2])
    assert_equal(child_1.reload.parent, @object)
  end


end
