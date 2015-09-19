* Database creation

 - create MySql user `bank` with password `bank`
 - `bundle exec rake db:create`
 - `bundle exec rake db:migrate`
 - `bundle exec rake db:test:prepare`


* How to run the test suite

```
bundle exec rspec spec
```
* For application business logic check lib directory `TransactionAgent` and `TransactionManager`
