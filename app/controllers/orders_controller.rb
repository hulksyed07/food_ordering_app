class OrdersController < ApplicationController
	before_action :authenticate_user!

  def my_cart
    @order = current_user.draft_order
  end

  def buy_now
    order = current_user.draft_order
    order.order_status = OrderStatus.find_by_name('Submitted')
    order.save
    redirect_to root_path, notice: 'Order Placed Successfully'
  end

  def clear_cart
    order = current_user.draft_order
    order.destroy
    redirect_to root_path, notice: 'Cart cleared'
  end

  def show
    @order = Order.find_by_id(params[:id])
  end

  def index
    @orders = current_user.orders
  end
end
