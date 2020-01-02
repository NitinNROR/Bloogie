class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]


  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
 
  def update
    @article = Article.find(params[:id])
    
    if @article.user == current_user
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    else
      access_alert
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.user == current_user
      @article.destroy
      redirect_to articles_path
    else
      access_alert
    end
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def access_alert 
      redirect_to articles_path
      flash[:alert] = "Unautherised access"
    end
end
