require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  # CONSTANTS
  test "constant true evaluates to true" do
    assert_equal true, programs(:constant_true).get_position(0)
  end
  test "constant false evaluates to false" do
    assert_equal false, programs(:constant_false).get_position(0)
  end
  # IF-THEN-ELSE
  # TODO: Write tests
  # OR
  test "false||false evaluates to false" do
    assert_equal false, programs(:or_both_false).get_position(0)
  end
  test "true||false evaluates to true" do
    assert_equal true, programs(:or_first_true).get_position(0)
  end
  test "false||true evaluates to true" do
    assert_equal true, programs(:or_second_true).get_position(0)
  end
  test "true||true evaluates to true" do
    assert_equal true, programs(:or_both_true).get_position(0)
  end



end
