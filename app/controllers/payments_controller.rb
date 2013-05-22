class PaymentsController < ApplicationController
  def new
  end
  def create
    token = params[:payment][:stripe_token]
    begin
      # It should be noted stripe deals only in integer change, so the charge below is $10.00.  Same applies to fees.
      charge = Stripe::Charge.create(:amount => 1000, :currency => 'usd', :card => token, :description => 'payment')
      Payment.create(:amount => 10.00, :fee => (charge.fee / 100.0), :charge_identifier => charge.id, :test_mode => Rails.env.development?)
    rescue Stripe::InvalidRequestError => e
      # Card declined...  redirect or render error page here.
    end
  end
end