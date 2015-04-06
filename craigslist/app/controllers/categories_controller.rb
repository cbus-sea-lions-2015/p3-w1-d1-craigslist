class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:category_id])
    @articles = @category.articles
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
