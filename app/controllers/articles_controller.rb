class ArticlesController < ApplicationController
    before_action :set_articles, only: [:show, :edit, :update, :destroy]
    def show
    end

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def destroy
      @article.destroy
      redirect_to articles_path
    end

    def create
      @article = Article.new(articles_params)
      if @article.save
        flash[:notice] = 'Article was created successfully.'
        redirect_to articles_path
      else
        render 'new'
      end
    end

    def update
      if @article.update(articles_params)
        flash[:notice] = 'Article was updated successfully.'
        redirect_to @article
    end

    private
    def set_articles
      @article = Article.find(params[:id])
    end

    def articles_params
      params.require(:article).permit(:title, :description)
    end
  end
end
