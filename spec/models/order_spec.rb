require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.find_or_create_by! name: 'Apparel'
      # Setup at least two products with different quantities, names, etc
      @product1 = @category.products.create!(name:'test', description: "First test product",
                            quantity: 10, price_cents: 64.99)
      @product2 = @category.products.create!(name:'test2', description: "Second test product",
                            quantity: 20, price_cents: 64.99)

    end
    it 'deducts quantity from products based on their line item quantities' do
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
       @order = Order.new(
        email: "123@test.com",
        total_cents: 10000,
        stripe_charge_id: 4 # returned by stripe
      )
      # 2. build line items on @order
      @order.line_items.new(
          product: @product1,
          quantity: 5,
          item_price: @product1.price,
          total_price: @product1.price * 5
        )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to be 5
      expect(@product2.quantity).to be 20
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do

    end
  end
end
