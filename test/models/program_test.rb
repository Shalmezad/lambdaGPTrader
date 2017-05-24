require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "constant true evaluates to true" do
    assert_equal true, programs(:constant_true).get_position(0)
  end

  test "constant false evaluates to false" do
    assert_equal false, programs(:constant_false).get_position(0)
  end

end
