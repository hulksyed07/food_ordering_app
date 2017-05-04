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
      if order.foods.include? @food
        cart = order.carts.find_by_food_id(@food.id)
        cart.update(quantity: cart.quantity + 1)
      else
        order.carts.create(item_name: @food.name, price: @food.price, quantity: 1, food_id: @food.id)
      end
    end

    redirect_to category_path(params[:category_id])
  end

  def remove_from_cart
    unless current_user.draft_order.blank?
      order = current_user.draft_order
      cart = order.carts.find_by_food_id(@food.id)
      unless cart.blank?
        if cart.quantity > 1
          cart.update(quantity: cart.quantity - 1)
        else
          cart.destroy
        end
      end

      if order.carts.reload.blank?
        order.destroy
      end
    end

    redirect_to category_path(params[:category_id])
  end

  private

  def set_food
    @food = Food.find_by_id(params[:id])
  end
end
