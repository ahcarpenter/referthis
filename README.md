<!-- https://github.com/twitter/bootstrap/blob/master/README.md
http://twitter.github.com/bootstrap/javascript.html
http://www.fileformat.info/info/unicode/char/b3/index.htm -->
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
ReferThis.url(endpoints¹, user_id, base_url, user_name[, app_name², body³])
```
¹object structure: ```{'email_address'=>value, 'phone_number'=>value}```

²defaults to ```Rails.application.class.to_s.split('::').first```

³defaults to ```referrer_name + ' has referred you to ' + app_name + '! You might be interested in checking out the following: ' + url + '/'```
###Analysis
```ruby
ReferThis.clicked_through_rate(email¹,sms¹,overall²)
```
¹defaults to ```false```

²defaults to ```true```
###In Production
http://referthisdemo.herokuapp.com
## Versioning
http://semver.org