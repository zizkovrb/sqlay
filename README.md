# Sqlay [![Build Status](https://travis-ci.org/zizkovrb/sqlay.svg?branch=master)](https://travis-ci.org/zizkovrb/sqlay)

Really simple sqlite3 bindings for ruby. Just for my education purposes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sqlay', github: 'simi/sqlay'
```

And then execute:

```
$ bundle
```

## Usage

```ruby
query = Sqlay.execute("test.db", "SELECT date('now') AS date;")
query[0]["date"] #=> '27/06/2013'

query = Sqlay.execute("test.db", "SELECT 15 AS number;")
query[0]["number"] #=> 15

query = Sqlay.execute(":memory:", "SELECT 3.1415 AS float;")
query[0]["float"] #=> 3.1415

query = Sqlay.execute(":memory:", "SELECT null AS nil;")
query[0]["nil"] #=> nil
```

## DONE

* basic data types works now (integer, float, string and null)
* basic error reporting (``Sqlay::Error`` with error message)

## TODO

* return valid BLOB

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
