class SMS
  @@account_sid = 'AC0b322d7367604e7a852a1d59193738a2'
  @@auth_token = 'c32bcf082cb7cee728a99832858db23b'
  @@client = Twilio::REST::Client.new(@@account_sid, @@auth_token)
  @@account = @@client.account
  
  def self.sieve(number)
    return number.to_s.gsub(/\D/, '')
  end
  def self.send_referral(referral, url, referrer_name, app_name)
    @@account.sms.messages.create(:from => '+18599030353', :to => Referee.find(referral.referee_id).endpoint, :body => referrer_name + ' has referred you to ' + app_name + '. You might be interested in checking out the following: ' + url + '/' + Base64::encode64(referral.id.to_s).chop + '.')
  end
end