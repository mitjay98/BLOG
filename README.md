##Getting started 

*This is analog of stack overflow where you can ask question, give answers, comment both and some other interesting features. Also admin functionality, roles and authentication system are present here implemented by custom decisions and popular gems*

####For running this app on your pc locally you need: 

> ruby 2.7.5 version

> rails 6.1.4.4

> install yarn

> install PostgreSql 14.5

####After installing all dependencies you need run following commands:

```
bundle install
```
```
yarn build
```
```
rails db:create 
```
```
rails db:migrate
```
As we dont use webpacker here you need run this command for compiling all JS and CSS libraries
```
bin/dev
````
