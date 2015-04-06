class ArticlesController < ApplicationController

  def show
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
  end

  def update

  end

  def delete
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
    @article.destroy
    redirect_to :category => 'Show'
  end

end
