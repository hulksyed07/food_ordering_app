class Order < ApplicationRecord
  belongs_to :order_status
  belongs_to :user
  has_many :carts,dependent: :destroy
  has_many :foods, through: :carts

  def total_price
  	carts.inject(0) { |total_price, cart| total_price + cart.total_price }
  end
end
