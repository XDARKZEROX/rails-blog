class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  def new
    @article = Article.new
  end

  def index
    # El campo params[:page] llega la pagina a la que se esta accediendo
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def edit; end

  def create
    # render plain: params[:article].inspect
    # @article = Article.new(article_params)
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = 'Article was succesfully created'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article was updated!'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private def set_article
    @article = Article.find(params[:id])
  end

  private def article_params
    params.require(:article).permit(:title, :description)
  end

  def show; end

  def destroy
    @article.destroy
    flash[:danger] = 'Article was removed'
    redirect_to articles_path
  end
end
