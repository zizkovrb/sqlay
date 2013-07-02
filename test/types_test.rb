require 'test_helper'

class TestTypes < MiniTest::Unit::TestCase
  def test_integer
    number = 16
    query = Sqlay.execute(":memory:", "SELECT #{number} AS number;")
    assert_equal(number, query[0]["number"])
  end

  def test_string
    string = "abc"
    query = Sqlay.execute(":memory:", "SELECT '#{string}' AS string;")
    assert_equal(string, query[0]["string"])
  end

  def test_float
    float = 16.333339
    query = Sqlay.execute(":memory:", "SELECT #{float} AS float;")
    assert_equal(float, query[0]["float"])
  end

  def test_null
    float = 16.333339
    query = Sqlay.execute(":memory:", "SELECT null AS nil;")
    assert_equal(nil, query[0]["nil"])
  end
end
