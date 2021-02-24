class ChargesController < ApplicationController
  def create
  # Set the amount you want to charge
  @amount = 500

  # Two API calls to stripe
  # One for creating a new customer
  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  # And another for charging
  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'React for Beginners Course',
    currency: 'eur',
  })

# Redirect for card error in the case of
rescue Stripe::CardError => e
  flash[:error] = e.message
  # this is where the re-direct happens in point of purchase happens!
  redirect_to :root
  end
end
