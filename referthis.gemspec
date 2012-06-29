# http://guides.rubygems.org/make-your-own-gem/
Gem::Specification.new do |s|
  s.name = 'referthis'
  s.version = '0.2.5'
  s.date = '2012-06-29'
  s.summary = ''
  s.authors = ''
  s.files = ['lib/referee.rb','lib/referral.rb','lib/sms.rb','lib/db/migrate/20120621004835_create_referrals.rb','lib/db/migrate/20120621004904_create_referees.rb','lib/db/migrate/20120621215402_add_keys.rb','lib/initializers/smtp_settings.rb','lib/mailers/mailer.rb']
  s.homepage = 'http://github.com/ahcarpenter/referthis'
end