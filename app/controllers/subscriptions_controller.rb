class SubscriptionsController < ApplicationController
  require 'json'
  def new
    @User = current_user

  end

  def index
    @User = current_user
   end

  def show

  end

  def create

    @User  = current_user
    Stripe.api_key = "sk_test_IkzixacJX3zSanfKPSFfetvq"
    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    bob = params[:bob]
    
    # Create a Customer
    customer = Stripe::Customer.create(
      :card => token,
      :plan => bob,
      :email => @User.email
    )
    
    customer_id = customer.id
    event_data = JSON.parse(customer.to_s)
    subscription = event_data["subscription"]["plan"]["name"]
    @User.subscription = subscription
    @User.update_attribute(:subscription, bob)
    @User.customer_id = customer.id.to_s
    @User.update_attribute(:customer_id, customer.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  def update
    @User = current_user
    c = Stripe::Customer.retrieve(@User.customer_id)
    c.update_subscription(:plan => :plan, :prorate => true)
    event_data = JSON.parse(customer.to_s)
    subscription = event_data["subscription"]["plan"]["name"]
    @User.subscription = subscription
    @User.customer_id = customer.id.to_s
    @User.update_attribute(:customer_id, customer.id)
  end

  def destroy
    @User = current_user

    cu = Stripe::Customer.retrieve(@User.customer_id)
    cu.cancel_subscription
  end


end