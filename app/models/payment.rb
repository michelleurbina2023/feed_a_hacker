class Payment < ActiveRecord::Base
  belongs_to :hacker
  attr_accessible :amount, :charge_identifier, :fee, :test_mode
  attr_accessor :stripe_token
end
