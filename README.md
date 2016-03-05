# Client filtering

Application for costumer segmentation, filtering the data using pre-defined criteria.

## How to run the application locally

Make sure Ruby and Rails are installed on your system. On the command line write and run commands below:

  `ruby -v`
  `rails -v`
  
You will know whether it's installed or not if you see their version numbers!


Then clone the git repository for your computer/server using:

  `git clone https://github.com/guifigueiroa/client_filtering.git`
  
Enter the directory where you cloned the application and install all dependencies:

  `bundle install`
  
Create database, migrate schema, and seed data to populate database:

  `rake db:create`
  `rake db:migrate`
  `rake db:seed`
  
Then run your application:

  `rails server`
