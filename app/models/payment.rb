class Payment < ActiveRecord::Base
  belongs_to :hacker
  attr_accessible :amount, :charge_identifier, :fee, :test_mode, :hacker_id, :hacker
  attr_accessor :stripe_token
end
