class OrderStatus < ApplicationRecord
	has_many :orders
	validates_presence_of :name
end
