class PaymentsController < ApplicationController
  protect_from_forgery except: :create

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
      currency: 'gbp',
      metadata: {
        name: params[:name],
        phone1: params[:phone1],
        comments: params[:comments]
      }
    )

    flash[:notice] = 'Payment successful!'
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
