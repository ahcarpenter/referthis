# http://stackoverflow.com/questions/6021372/best-way-to-create-unique-token-in-rails
class Mailer < ActionMailer::Base
  def send_referral(referral, url, referrer_name, optional)
    mail(:to => Referee.find(referral.referee_id).endpoint, :subject => optional[:app_name], :body => optional[:body] + Base64::encode64(referral.id.to_s).chop + '.')
  end
end