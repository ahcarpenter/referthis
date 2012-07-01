<!-- https://github.com/twitter/bootstrap/blob/master/README.md
http://twitter.github.com/bootstrap/javascript.html -->
# ReferThis [![Build Status](https://secure.travis-ci.org/ahcarpenter/referthis.png?branch=master)][travis]

[travis]: http://travis-ci.org/ahcarpenter/referthis

##Example Implementation
http://referthisdemo.herokuapp.com

## Installation
```referthis``` can be installed via the execution of the following command:
```
gem install referthis
```
The backend can be setup via the execution of the following command:
```ruby
ReferThis.setup
```

##Usage
###Transmission
```ruby
ReferThis.url(<endpoints>¹, <user_id>, <base_url>, <user_name>, <app_name>²)
```
¹```<endpoints>``` object structure: ```{'email_address'=><value>, 'phone_number'=><value>}```

²```<app_name>``` defaults to ```Rails.application.class.to_s.split('::').first```
###Analysis
```ruby
ReferThis.clicked_through_rate(<email>¹,<sms>¹,<overall>²)
```
¹```<email>``` defaults to ```false```

²```<overall>``` defaults to ```true```
## Versioning
http://semver.org