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

  factory :user do
    email 'test1@tester.com'
    username 'tester1'
    password '123456'
  end

  factory :order do
    order_status_id { FactoryGirl.create(:order_status).id }
    user_id { FactoryGirl.create(:user).id }
  end

  factory :cart do
    item_name 'TestFood_1'
    price 100
    quantity 1
    food_id { FactoryGirl.create(:food).id }
    order_id { FactoryGirl.create(:order).id }
  end

end