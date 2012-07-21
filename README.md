<!-- https://github.com/twitter/bootstrap/blob/master/README.md
http://twitter.github.com/bootstrap/javascript.html -->
# ReferThis [![Build Status](https://secure.travis-ci.org/ahcarpenter/referthis.png?branch=master)][travis]
[travis]: http://travis-ci.org/ahcarpenter/referthis
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
ReferThis.url(endpoints¹, user_id, base_url, user_name[, optional²])
```
######¹object structure
>```ruby
{'email_address'=>value, 'phone_number'=>value}
```

######²defaults to
>```ruby
{:app_name=>Rails.application.class.to_s.split('::').first, :body=>referrer_name + ' has referred you to ' + optional[:app_name] + '! You might be interested in checking out the following: ' + url + '/'}
```

###Analysis
```ruby
ReferThis.clicked_through_rate(email¹,sms¹,overall²)
```
######¹defaults to
>```ruby
false
```

######²defaults to
>```ruby
true
```
###In Production
http://referthisdemo.herokuapp.com
## Versioning
http://semver.org