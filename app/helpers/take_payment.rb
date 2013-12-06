require "rubygems"
require "braintree"

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "zm39btd8v5mm62ws"
Braintree::Configuration.public_key = "pdm38t7nnycrmrpx"
Braintree::Configuration.private_key = "a074f2341674613fd36e8caeebadc068"


result = Braintree::Transaction.sale(
  :amount => "1000.00",
  :credit_card => {
    :number => "5105105105105100",
    :expiration_month => "05",
    :expiration_year => "12"
  }
)

if result.success?
  puts "Transaction ID: #{result.transaction.id}"
  # status will be authorized or submitted_for_settlement
  puts "Transaction Status: #{result.transaction.status}"
else
  puts "Message: #{result.message}"
  if result.transaction.nil?
    # validation errors prevented transaction from being created
    p result.errors
  else
    puts "Transaction ID: #{result.transaction.id}"
    # status will be processor_declined, gateway_rejected, or failed
    puts "Transaction Status: #{result.transaction.status}"
  end
end