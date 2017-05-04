require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "create a new Order" do
  	it "should create a new Order with given user_id" do
	  	order = create(:order)
	  	expect(order.order_status.name).to eq('TestStatus_1')
	  end

  end

  describe "update or delete a Order" do
  	before(:each) do
  		@order = create(:order)
  	end

  	it "should update an order status with valid params" do
	  	order_status = create(:order_status, name: 'TestStatus_2')
      @order.order_status = order_status
      @order.save
	  	expect(@order.reload.order_status.name).to eq('TestStatus_2')
	  end

	  it "should delete an order with valid id" do
	  	order = Order.find_by_id(@order.id)
	  	order.delete

	  	expect(Order.find_by_id(@order.id)).to eq(nil)
	  end
  end
end
