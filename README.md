# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version => (2>=.5.1)



* System dependencies

Rails 5.2.4, 

database => Postgres,

install Postman to hit Api



* Configuration

    run these commands

    => set your database.yml according to your local database configuration

    => bundle install

    => rake db:create

    => rake db:reset

    => rails s


* How to run the test suite


    first hit the api to get the authentication token as shown below

    ![alt text](https://github.com/Usmanriaz665/Passion.io/blob/master/public/authenticate_request.png)

    now you can use this authentication token as shown below (i.e provide name to create a new vertical)

    ![alt text](https://github.com/Usmanriaz665/Passion.io/blob/master/public/token_request.png)



* How does your solution perform?

    Our Solution is scaled uses well-tested business logic with concerns,scops and email service.

* How does your solution scale?

    Our code can scaled to multiple incomming request by getting only a chunk of data at a time so that when multiple request came in the critical region it do not breaks.

* What would you improve next?

    The Scalibilty can be improved by using multithreading idea so the code becomes more reliable and scure on multiple requests.


