require 'rails_helper'

RSpec.describe Food, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "create a new Food" do
  	it "should create a new Food with valid params" do
	  	food = create(:food)
	  	expect(food.name).to eq('TestFood_1')
	  end

	  it "should not create a new Food with invalid params" do
	  	food = build(:food, name: "")
	  	expect(food.valid?).to eq(false)
	  end
  end

  describe "update or delete a Food" do
  	before(:each) do
  		@food = create(:food)
  	end

  	it "should update an food with valid params" do
	  	@food.update(name: 'TestFood_2')
	  	expect(@food.reload.name).to eq('TestFood_2')
	  end

	  it "should not update an food with invalid params" do
	  	@food.update(name: '')

	  	expect(@food.reload.name).not_to eq('')
	  end

	  it "should delete an food with valid id" do
	  	food = Food.find_by_id(@food.id)
	  	food.delete

	  	expect(Food.find_by_id(@food.id)).to eq(nil)
	  end
  end
end
