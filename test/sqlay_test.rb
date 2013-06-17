require 'test_helper'

class TestSqlay < MiniTest::Unit::TestCase
  def test_module_exist
    assert_equal(Module, Sqlay.class)
  end

  def test_query_method_with_good_path
    File.delete("test.db") if File.exists?("test.db")
    assert Sqlay.execute("test.db", "SELECT date('now');")
  end

  def test_query_method_with_bad_path
    File.delete("test.db") if File.exists?("test.db")
    refute Sqlay.execute("/a/c/d/e/test.db", "SELECT date('now');")
  end

  def test_query_date
    date = Time.now.to_s.split(' ').first
    query = Sqlay.execute("test.db", "SELECT date('now') AS date;")
    assert_equal(date, query[0]["date"])
  end
end
