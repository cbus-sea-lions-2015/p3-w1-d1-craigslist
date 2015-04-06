class CategoriesController < ApplicationController

  def index
    @categories = Categories.all
  end

  def show
    @category = Category.find(params[:category_id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
