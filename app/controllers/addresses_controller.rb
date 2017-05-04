class AddressesController < ApplicationController
	before_action :authenticate_user!
  before_action :set_address, except: [:create, :new]

  def index
    if @address.blank?
      redirect_to new_address_path
    end
  end

  def new
    @address = current_user.build_address
  end

  def edit_my_address
  end

  def create
    @address = current_user.build_address(address_params)
    if @address.save
      redirect_to addresses_path
    else
      render :new
    end
  end

  def update
    if current_user.address.update(address_params)
      redirect_to addresses_path
    else
      render :edit_my_address
    end
  end

  private
  def set_address
    @address = current_user.address
  end

  def address_params
    params.require(:address).permit(:full_name, :city, :street, :flat_no, :phone)
  end
end
