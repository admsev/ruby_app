# The task

Before you start coding (and let’s be honest, we know that’s what you want to do), please read the following.

Firstly, the test should take you no more than 2.5 hours to complete.

Secondly, the test is for us to see how you code and the methodologies you use, what we will be looking for in this test are the following:

* Functionality
* Efficiency – We like clean, simple code.
* Readability
* Tests (we have 96% test coverage in our code and we aim to keep it that way).
* Also, we would like to understand your ability to use TDD and OO, so please ensure
these are part of your complete test.
* Feel free to submit your solution as a link to your version control repository

The test is as follows:
1. ruby_app

Write a ruby script that:

1. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
2. Returns the following:
    * list of webpages with most page views ordered from most pages views to less page views e.g.:
      ```
      /home 90 visits
      /index 80 visits
      etc...
      ```
    * list of webpages with most unique page views also ordered
      e.g.:
      ```
      /about/2 8 unique views
      /index 5 unique views
      etc...
      ```

Finally, have some fun – Feel free to make changes or design something if you think it meets the criteria above, but would produce better outcomes and of course, the sooner you return the test, the quicker we can move the process.

# Notes by Alexander Manzyuk (move to README)
## Note: there was bad formatting of the test task PDF.
In real life, I would clarify requirements (at least, formatting of the output: it was unclear whether the app should print each page report on a new line).

# Potential enhancements

## Make it 2 commands like this:

    * `ruby parser.rb --visits webserver.log`
    * `ruby parser.rb --unique-visits webserver.log`

Having these reports separate will make it easier to work with, both for people and other utilities.

Consider using [Thor](https://github.com/erikhuda/thor) for this purpose.
