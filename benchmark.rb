require 'bundler'
require 'benchmark'

Bundler.setup
require 'sqlay'
require 'sqlite3'

n = 1000

sql = "SELECT date('now');"

Benchmark.bm(7) do |x|
  x.report("sqlay")  { n.times { Sqlay.execute(":memory:", sql) } }
  x.report("sqlite") { n.times { db = SQLite3::Database.new ":memory:"; db.execute(sql) } }
end
