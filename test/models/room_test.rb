require "test_helper"

class RoomTest < ActiveSupport::TestCase
  test "sets code" do
    room = Room.create()
    assert_not_nil room.code
  end
  
  test "codes are unique" do
    codes = []
    1000.times do |i|
      r = Room.create()
      codes.push(r.code)
    end

    assert codes.uniq.length == 1000
  end
end
