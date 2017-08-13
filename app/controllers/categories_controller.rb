class CategoriesController < ApplicationController
	before_action :authenticate_user!
  before_action :set_category
  before_action :filter_non_admins
  NON_ADMIN_ACTIONS = [:show, :index]
  
  def show
	end

	def new
	end

	def edit
	end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
