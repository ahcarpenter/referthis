# http://ruby-doc.org/core-1.9.3/File.html#method-c-dirname
# http://www.google.com/search?sugexp=chrome,mod=4&sourceid=chrome&ie=UTF-8&q=path+of+current+file+ruby
# http://www.rubyist.net/~slagell/ruby/inheritance.html
# http://stackoverflow.com/questions/3724487/rails-root-directory-path
# http://stackoverflow.com/questions/3539148/how-do-i-access-the-name-of-the-rails-3-application-object
require 'referral'
require 'referee'
class ReferThis < Referral
  def self.setup
    system('cp -r ' + File.dirname(File.absolute_path(__FILE__)) + '/db/migrate/* ' + "'" + Rails.root.to_s.split('app/').first + "/db/migrate/'")
    system('rake db:migrate')
  end 
  def self.url(endpoints, user_current_id, url, referrer_name, optional = {:app_name=>Rails.application.class.to_s.split('::').first})
    optional[:body].nil? ? optional[:body] = referrer_name + ' has referred you to ' + optional[:app_name] + '! You might be interested in checking out the following: ' + url + '/' : optional[:body]
    optional[:app_name].nil? ? optional[:app_name] = Rails.application.class.to_s.split('::').first : optional[:app_name]
    self.generate_referral(endpoints, user_current_id, url, referrer_name, optional)
  end
end