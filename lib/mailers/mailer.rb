# http://stackoverflow.com/questions/6021372/best-way-to-create-unique-token-in-rails
class Mailer < ActionMailer::Base
  def send_referral(referral, url, referrer_name, app_name)
    mail(:to => Referee.find(referral.referee_id).endpoint, :subject => app_name, :body => referrer_name + ' has referred you to ' + app_name + '. You might be interested in checking out the following: ' + url + '/' + Base64::encode64(referral.id.to_s).chop + '.')
  end
end