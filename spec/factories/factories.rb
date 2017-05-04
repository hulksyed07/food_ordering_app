FactoryGirl.define do
  factory :category do
    name "Category_1"
  end

  factory :food do
  	name 'TestFood_1'
    price 100
    category_id { FactoryGirl.create(:category).id }
  end

  factory :order_status do
  	name 'TestStatus_1'
  end

end