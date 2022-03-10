# yl_ruby_app
Display number of views &amp; unique views per each visited web page from  webserver.log

The test is as follows:
1. yl_ruby_app
  Write a ruby script that:

   a. Receives a log as argument (webserver.log is provided)
    e.g.: ./parser.rb webserver.log

   b. Returns the following:
      * list of webpages with most page views ordered from most pages views to less page views

         e.g.:
          /home 90 visits /index 80 visits etc...

      * list of webpages with most unique page views also ordered

        e.g.:
          /about/2 8 unique views
          /index 5 unique views etc...

Solution:

As mentioned in above task, yl_ruby_app script will display the number of views and unique views per each visited page by using provided log file.

The sample log file: webserver.log

Setup:
  This project is using:

  1. ruby 3.0
  2. rspec gem as the tests framework.

Run Application:
  1. Please clone the yl_ruby_app git repository into your local
  2. On project path please run 'bundle install'
    $: bundle install

  3. To see the number of views and unique views per page please run below command
    $: ruby ./lib/parser.rb webserver.log

  4. To check test cases
  $: bundle exec rspec spec/

Approach: My main goal is splitting a set of actions into smaller sets so that a Class executes only the set of actions it requires.

```Parser``` is used as the application layer that consumes the domain logic and outputs the results.
```LogData::Formatter``` class is used to validate and read the log file and format log data into
 new data structure
```LogData::Parser``` class is used to parse formatted log data and return visited pages and their views count
```LogData::Presenter``` class is used to display required output from parsed data in LogData::Parser

I've covered all test cases using Rspec and used sample data file under fixtures folder.

Thank you for taking your time to review my code.
