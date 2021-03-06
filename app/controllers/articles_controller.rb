class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  def index
    @articles = Article.all
    @article = Article.new
    @like = Like.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:content)
  end

end
