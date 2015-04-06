class ArticlesController < ApplicationController



  def new
    @category = Category.find(params[:category_id])
    @article = @category.articles.new
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.new(article_params)
    if @article.save
      redirect_to category_article_path(@category, @article)
    else
      render 'new'
    end
  end

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
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
    @article.destroy
    redirect_to @category
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
