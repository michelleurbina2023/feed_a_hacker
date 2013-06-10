class PaymentsController < ApplicationController
before_filter :load_hacker
  def new
    @payment = Payment.new
    @payment.hacker = @hacker
  end

  def create
    unless @hacker
      redirect_to hackers_url
      return
    end
    token = params[:payment][:stripe_token]
    begin
      # It should be noted stripe deals only in integer change, so the charge below is $10.00.  Same applies to fees.
      charge = Stripe::Charge.create(:amount => 1000, :currency => 'gbp', :card => token, :description => 'payment')
      Payment.create(:hacker => @hacker, :amount => 10.00, :fee => (charge.fee / 100.0), :charge_identifier => charge.id, :test_mode => Rails.env.development?)
      redirect_to hackers_url
    rescue Stripe::CardError => e
      redirect_to new_hacker_payment_path(@hacker), :error => "Card denied."
    end
  end

  private

  def load_hacker
    @hacker = Hacker.find(params[:hacker_id]) rescue nil
  end
end
