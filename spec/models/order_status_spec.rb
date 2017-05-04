require 'rails_helper'

RSpec.describe OrderStatus, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "create a new OrderStatus" do
  	it "should create a new OrderStatus with valid params" do
	  	order_status = create(:order_status)
	  	expect(order_status.name).to eq('TestStatus_1')
	  end

	  it "should not create a new OrderStatus with invalid params" do
	  	order_status = build(:order_status, name: "")
	  	expect(order_status.valid?).to eq(false)
	  end
  end

  describe "update or delete a OrderStatus" do
  	before(:each) do
  		@order_status = create(:order_status)
  	end

  	it "should update an order_status with valid params" do
	  	@order_status.update(name: 'TestStatus_2')
	  	expect(@order_status.reload.name).to eq('TestStatus_2')
	  end

	  it "should not update an order_status with invalid params" do
	  	@order_status.update(name: '')

	  	expect(@order_status.reload.name).not_to eq('')
	  end

	  it "should delete an order_status with valid id" do
	  	order_status = OrderStatus.find_by_id(@order_status.id)
	  	order_status.delete

	  	expect(OrderStatus.find_by_id(@order_status.id)).to eq(nil)
	  end
  end
end
