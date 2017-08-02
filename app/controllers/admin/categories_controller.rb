class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create!(category_params)
    redirect_to [:admin, :categories], notice: "Category Created!"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end



end
