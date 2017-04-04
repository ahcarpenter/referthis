<!-- https://github.com/twitter/bootstrap/blob/master/README.md
http://twitter.github.com/bootstrap/javascript.html -->
# ReferThis [![Build Status](https://secure.travis-ci.org/ahcarpenter/referthis.png?branch=master)][travis] [![Gem Version](https://badge.fury.io/rb/referthis.svg)](https://badge.fury.io/rb/referthis)
[travis]: http://travis-ci.org/ahcarpenter/referthis
## Installation
```referthis``` can be installed via the execution of the following command:
```
gem install referthis
```
The backend can be setup via the execution of the following command:
```
ReferThis.setup
```
## Usage
### Transmission
```
ReferThis.url(endpoints¹, user_id, base_url, user_name[, optional²])
```

¹object structure
```
{'email_address'=>value, 'phone_number'=>value}
```

²defaults to
```
{:app_name=>Rails.application.class.to_s.split('::').first}
```

Subsequently, ```optional[:body]``` defaults to

```
referrer_name + ' has referred you to ' + optional[:app_name] + '! You might be interested in checking out the following: ' + url + '/'
```

### Analysis

```
ReferThis.clicked_through_rate(email¹,sms¹,overall²)
```

¹defaults to

```
false
```

²defaults to

```
true
```

### In Production

http://referthisdemo.herokuapp.com

## Versioning

http://semver.org
