class PaymentsController < ApplicationController
  def new
  end

  def create
    @amount = 1

    customer = Stripe::Customer.create(
      email: params[:email],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'CAMHS Consultation Session',
      currency: 'gbp'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
  end
end
