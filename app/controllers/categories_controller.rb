class CategoriesController < ApplicationController
	before_action :set_catogory
  
  def show
    @foods = @category.foods
	end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
