# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :reqiure_permission_to_edit, only: %i[edit update destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
    render :new, layout: "markdown"
  end

  def edit
    render :edit, layout: "markdown"
  end

  def create
    @article = current_user.articles.new(article_params)

     if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :public)
  end

  def reqiure_permission_to_edit
    redirect_to articles_url, notice: 'Permission denied.' unless @article.user == current_user
  end
end
