class FoodsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_food

  def show

  end

  def add_to_cart
    if current_user.draft_order.blank?
      order_status = OrderStatus.find_by_name('Draft')
      order = order_status.orders.create(user_id: current_user.id)
      order.carts.create(item_name: @food.name, price: @food.price, quantity: 1, food_id: @food.id)
    else
      order = current_user.draft_order
      order.carts.create(item_name: @food.name, price: @food.price, quantity: 1, food_id: @food.id)
    end

    redirect_to category_path(params[:category_id])
  end

  private

  def set_food
    @food = Food.find_by_id(params[:id])
  end
end
