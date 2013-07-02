require 'test_helper'

class TestSqlay < MiniTest::Unit::TestCase
  def test_module_exist
    assert_equal(Module, Sqlay.class)
  end

  def test_query_method_with_good_path
    assert Sqlay.execute(":memory:", "SELECT date('now');")
  end

  def test_cannot_open_database
    assert_raises(Sqlay::Error) {
      Sqlay.execute("/a/b/c/d", "SELECT date('now');")
    }
  end

  def test_query_date
    date = Time.now.utc.to_s.split(' ').first
    query = Sqlay.execute(":memory:", "SELECT date('now') AS date;")
    assert_equal(date, query[0]["date"])
  end

  def test_error
    assert_raises(Sqlay::Error, "Error 1, message: 'near \"null\": syntax error'") {
      Sqlay.execute(":memory:", "SELECT null AS null;")
    }
  end
end
