require 'active_record'
require 'mailers/mailer'
require 'sms'
class Referral < ActiveRecord::Base
  attr_accessible :referee_id, :user_id

  def self.construct(referee_id)
    referral = Referral.new
    referral.referee_id = referee_id
    referral.user_id = @user_current_id
    referral.save
    return referral
  end
  def self.generate_referral(endpoints, user_current_id, url, referrer_name, app_name)
    threads = []
    @user_current_id = user_current_id
    if endpoints[:phone_number] != ''
      threads << Thread.new('sms'){
        phone_number = SMS.sieve(endpoints[:phone_number])
        if Referee.exists?(:endpoint => phone_number)
          SMS.send_referral(self.construct(Referee.find_by_endpoint(phone_number.to_s).id), url, referrer_name, app_name)
        else
          SMS.send_referral(self.construct(Referee.construct(phone_number.to_s).id), url, referrer_name, app_name)
        end
      }
    end
    if endpoints[:email_address] != ''
      threads << Thread.new('email'){
        email_address = endpoints[:email_address]
        begin
        if Referee.exists?(:endpoint => email_address)
          Mailer.send_referral(self.construct(Referee.find_by_endpoint(email_address).id), url, referrer_name, app_name).deliver
        else
          Mailer.send_referral(self.construct(Referee.construct(email_address).id), url, referrer_name, app_name).deliver
        end
        rescue Net::SMTPSyntaxError
          puts 'Hello'
        end
      }
    end
    threads.each {|thread| thread.join}
  end
  def self.clicked_through_stat(email=false, sms=false, overall=true)
    if email || sms
      referrals = Referral.all
      if referrals.any?
        count_email = 0
        clicked_through_email = 0
        count_sms = 0
        clicked_through_sms = 0
        for referral in referrals
          if email
            if Referee.find(referral.referee_id).endpoint.include? '@'
              count_email += 1 
              clicked_through_email += 1 if referral.visits > 0
            end
          end
          if sms
            if !Referee.find(referral.referee_id).endpoint.include? '@'
              count_sms += 1 
              clicked_through_sms += 1 if referral.visits > 0
            end
          end 
        end
        puts ((clicked_through_email.to_f / count_email.to_f) * 100).to_s + '%' if email
        puts ((clicked_through_sms.to_f / count_sms.to_f) * 100).to_s + '%' if sms
      else
        puts '0%'
      end
    end
    puts ((Referral.where('visits > 0').count.to_f / Referral.count.to_f) * 100).to_s + '%' if overall
  end
  def self.resolve_token(token)
    referral_id = Base64::decode64(token)
    if self.exists?(:id => referral_id)
      referral = self.find(referral_id) 
      referral.visits = referral.visits + 1
      referral.save
    end
  end
end