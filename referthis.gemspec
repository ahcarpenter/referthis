# http://guides.rubygems.org/make-your-own-gem/
Gem::Specification.new do |s|
  s.name = 'referthis'
  s.version = '0.4.9'
  s.date = '2012-07-01'
  s.summary = ''
  s.authors = ''
  s.files = ['lib/referee.rb','lib/referral.rb','lib/sms.rb','lib/db/migrate/20120621004835_create_referrals.rb','lib/db/migrate/20120621004904_create_referees.rb','lib/db/migrate/20120621215402_add_keys.rb','lib/mailers/mailer.rb','lib/referthis.rb']
  s.homepage = 'http://github.com/ahcarpenter/referthis'
  s.add_runtime_dependency 'active_record'
end