class CategoriesController < ApplicationController
	before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit,:update]
  before_action :filter_non_admins, except: [:show, :index]
  
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
