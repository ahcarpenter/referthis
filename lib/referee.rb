# http://ryanbigg.com/2011/01/extending-active-record/
require 'active_record'
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