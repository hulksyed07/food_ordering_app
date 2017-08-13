class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_one :draft_order, -> { where order_status: OrderStatus.find_by_name('Draft')} , class_name: 'Order'
  has_one :address

  def cart_size
    draft_order.blank? ? 0 : draft_order.carts.count
  end

  def is_admin?
    Admin.all.map(&:email).include? email.downcase
  end
end
