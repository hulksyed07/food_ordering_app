require 'rails_helper'

RSpec.describe Category, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "create a new Category" do
  	it "should create a new Category with valid params" do
	  	category = create(:category)
	  	expect(category.name).to eq('Category_1')
	  end

	  it "should not create a new Category with invalid params" do
	  	category = build(:category, name: "")
	  	expect(category.valid?).to eq(false)
	  end
  end

  describe "update or delete a Category" do
  	before(:each) do
  		@category = create(:category)
  	end

  	it "should update an category with valid params" do
	  	@category.update(name: 'Category_2')
	  	expect(@category.reload.name).to eq('Category_2')
	  end

	  it "should not update an category with invalid params" do
	  	@category.update(name: '')

	  	expect(@category.reload.name).not_to eq('')
	  end

	  it "should delete an category with valid id" do
	  	category = Category.find_by_id(@category.id)
	  	category.delete

	  	expect(Category.find_by_id(@category.id)).to eq(nil)
	  end
  end
end
