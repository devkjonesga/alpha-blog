class ArticlesController < ApplicationController
  before_action :set_article, only:[:edit, :update, :show, :destroy]
  def new
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)

    if @article.save
      redirect_to article_path(@article)
      flash[:notice] = "Article was successfully created!"
    else
      render 'new'
    end

  end

  def show
    #@article = Article.find(params[:id]) #moved to private method#
  end

  def edit
    #@article = Article.find(params[:id]) #moved to private method
  end

  def update
    #@article = Article.find(params[:id]) #moved to private method
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  def index
    #@articles instance variable can be named anything
    @articles = Article.all
  end
  def destroy
    #@article = Article.find(params[:id]) #moved to private method
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path

  end

  private

    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
