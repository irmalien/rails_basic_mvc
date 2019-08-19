class ArticlesController < ApplicationController
  before_action :set_article, except: [:index, :new, :create]

  def index
    articles = Article.all

    render :index, locals: { articles: articles }
  end
  def new
    article = Article.new

    render :new, locals: { article: article }
  end

  def create
    article = Article.new(article_params)
    return redirect_to articles_path, notice: 'Article created' if article.save
    render :new, locals: { article: article }
  end

  def show; end

  def edit; end

  def update
    return redirect_to articles_path if @article.update(article_params)
    render :edit
  end

  def destroy
    return redirect_to articles_path, notice: 'Article deleted' if @article.destroy
    raise 'error: could not be deleted', @article.inspect
  end

    private

    def article_params
      params.require(:article).permit(:title, :body)
    end

def set_article
  @article = Article.find(params[:id])
end

end
