require 'rails_helper'


RSpec.describe OrdersController, type: :controller do

  
  # User.delete_all
  login_user
  
  
  let(:valid_attributes) {
    
    FactoryGirl.attributes_for(:order)
  }


  
  let(:valid_session) { {"warden.user.user.key" => session["warden.user.user.key"]} }



  describe "Orders " do
    # @user = login_user

    it " Index  assigns all orders as @orders" do
      # order = Order.create! valid_attributes
      # user = login_user
      user = User.find_by_username('tester2')
      user.orders.create(:order_status_id => 1)

      get :index, params: {}, session: valid_session
      # puts response.inspect
      expect(assigns(:orders)).to eq(user.orders)

      expect(response).to be_success
      expect(response).to render_template(:index)
    end


    it "buy now buys the specified order" do
      user = User.find_by_username('tester2')
      OrderStatus.create([{name: 'Draft'}, {name: 'Submitted'}])
      order_status = OrderStatus.find_by_name('Draft')
      order = user.orders.create(:order_status_id => order_status.id)
      post :buy_now, params: {}, session: valid_session
      expect(response).to redirect_to('/')
      expect(order.reload.order_status.name).to eql('Submitted')
    end

    it "shows my cart for the current user" do
      user = User.find_by_username('tester2')
      OrderStatus.create([{name: 'Draft'}, {name: 'Submitted'}])
      order_status_1 = OrderStatus.find_by_name('Submitted')
      order_status_2 = OrderStatus.find_by_name('Draft')
      order_1 = user.orders.create(:order_status_id => order_status_1.id)
      order_2 = user.orders.create(:order_status_id => order_status_2.id)
      get :my_cart, params: {}, session: valid_session
      expect(assigns(:order)).to eq(order_2)
      expect(response).to be_success
      expect(response).to render_template(:my_cart)
    end

  end

  
end
