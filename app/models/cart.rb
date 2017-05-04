class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :food

  def total_price
  	price * quantity
  end
end
