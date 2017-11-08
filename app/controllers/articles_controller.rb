class ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
   def index
     @articles = Article.all
   end
   def new
   end
   def create
     if @article.save
       redirect_to articles_path
     else
       render :new
     end
   end
   def edit
   end
   def update
     if @article.update(article_params)
       redirect_to articles_path
     else
       render :edit
     end
   end
   def destroy
     @article.destroy
     redirect_to articles_path
   end
   def show
   end
   private
   def article_params
     params.require(:article).permit(:title, :content, :from, :url, :read_number)
   end
 end
