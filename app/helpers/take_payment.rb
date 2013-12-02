require "rubygems"
require "braintree"

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "zm39btd8v5mm62ws"
Braintree::Configuration.public_key = "pdm38t7nnycrmrpx"
Braintree::Configuration.private_key = "a074f2341674613fd36e8caeebadc068"


get "/" do
  erb :braintree
end

post "/create_transaction" do
  result = Braintree::Transaction.sale(
    :amount => "1000.00",
    :credit_card => {
      :number => params[:number],
      :cvv => params[:cvv],
      :expiration_month => params[:month],
      :expiration_year => params[:year]
    },
    :options => {
      :submit_for_settlement => true
    }
  )

  if result.success?
    "<h1>Success! Transaction ID: #{result.transaction.id}</h1>"
  else
    "<h1>Error: #{result.message}</h1>"
  end
end
