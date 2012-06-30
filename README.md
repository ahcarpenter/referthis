<!-- https://github.com/twitter/bootstrap/blob/master/README.md
http://twitter.github.com/bootstrap/javascript.html -->
# ReferThis

## Installation
```referthis``` can be installed via the execution of the following command:
```
gem install referthis
```
Migrations can be migrated via the execution of the following command:
```ruby
ReferThis.setup
```

##Usage
```ruby
ReferThis.url(<endpoints>¹, <user_id>, <base_url>, <user_name>, <app_name>²)
```
¹```ruby <endpoints>``` object structure: ```{'email_address' : 'value', 'phone_number' : 'value'}```
²```ruby <app_name>``` defaults to ```ruby Rails.application.class.to_s.split("::").first```

## Versioning
http://semver.org