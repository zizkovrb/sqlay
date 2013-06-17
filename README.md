# Sqlay

Really simple sqlite3 bindings for ruby. Just for my education purposes.

## Installation

Add this line to your application's Gemfile:

    gem 'sqlay'

And then execute:

    $ bundle

## Usage

```ruby
    query = Sqlay.execute("test.db", "SELECT date('now') AS date;")
    query[0]["date"] #=> '27/06/2013'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
