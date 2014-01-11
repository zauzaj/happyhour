require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user testing model" do
    user =  User.new()
    assert !user.save, "User saved unsuccessefuly"
  end

end
