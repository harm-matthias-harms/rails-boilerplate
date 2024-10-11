# frozen_string_literal: true

# This migration comes from pay (originally 2)
class AddPayStiColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :pay_customers, :type, :string
    add_column :pay_charges, :type, :string
    add_column :pay_subscriptions, :type, :string

    rename_column :pay_payment_methods, :type, :payment_method_type
    add_column :pay_payment_methods, :type, :string

    add_column :pay_merchants, :type, :string

    Pay::Customer.find_each do |pay_customer|
      pay_customer.update(type: "Pay::#{pay_customer.processor.classify}::Customer")

      pay_customer.charges.update_all(type: "Pay::#{pay_customer.processor.classify}::Charge") # rubocop:disable Rails/SkipsModelValidations
      pay_customer.subscriptions.update_all(type: "Pay::#{pay_customer.processor.classify}::Subscription") # rubocop:disable Rails/SkipsModelValidations
      pay_customer.payment_methods.update_all(type: "Pay::#{pay_customer.processor.classify}::PaymentMethod") # rubocop:disable Rails/SkipsModelValidations
    end

    Pay::Merchant.find_each do |pay_merchant|
      pay_merchant.update(type: "Pay::#{pay_merchant.processor.classify}::Merchant")
    end
  end
end
