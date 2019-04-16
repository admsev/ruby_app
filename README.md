# Setup
bundle install
## Running tests
* `bundle exec rspec`
* See `coverage/index.html` for the coverage report

## Running the app
`ruby ruby_app.rb webserver.log`

# Notes by Alexander Manzyuk
## Note: there was a bad formatting of the test task PDF.
Output example in the PDF was messed up.

In real life, I would clarify requirements (at least, formatting of the output: it was unclear whether the app should print each page report on a new line).

# Potential enhancements

## Make it 2 commands like this:

* `ruby parser.rb --visits webserver.log`
* `ruby parser.rb --unique-visits webserver.log`

Having these reports separate will make it easier to work with, both for people and other utilities.

Consider [Thor](https://github.com/erikhuda/thor) to make it in conventional way.
