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
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to category_article_path(@category, @article)
    else
      render 'Edit'
    end
  end

  def delete
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
    @article.destroy
    redirect_to :category => 'Show'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
