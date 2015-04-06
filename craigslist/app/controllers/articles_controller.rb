class ArticlesController < ApplicationController
  before_filter :set_category
  before_filter :set_user_article, only: [:edit, :update, :destroy]
  before_filter :set_article, only: [:new, :create, :show]

  before_filter :authenticate, except: :show

  def new
  end

  def create
    @article.attributes = article_params.merge({user: current_user})
    if @article.save
      redirect_to category_article_path(@category, @article)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article && @article.update(article_params)
      redirect_to category_article_path(@article.category_id, @article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to @category
  end

  private

  def set_article
    @article = if params[:id]
      @category.articles.find_by(id: params[:id])
    else
      @category.articles.new
    end
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_user_article
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
