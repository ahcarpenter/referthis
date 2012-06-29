class Referee < ActiveRecord::Base
  attr_accessible :endpoint
  has_many :referrals
  
  def self.construct(endpoint)
    referee = Referee.new
    referee.endpoint = endpoint
    referee.save
    return referee
  end
end