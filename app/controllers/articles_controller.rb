class ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
   def index
     @articles = Article.all.includes(:user,:labels, :pictures)
   end
   def new
     @labels = Label.all.map { |label| [label.name, label.id.to_s] }
     @pictures = Picture.all.map { |picture| [picture.photo, picture.id.to_s]}
   end
   def create
     @article = current_user.articles.build(article_params)
     selected_labels = Label.in(id: params["checked_labels"].try(:values))
     @article.labels << selected_labels
     selected_pictures = Picture.in(id: params["checked_pictures"].try(:values))
     @article.pictures << selected_pictures
     if @article.save
       redirect_to articles_path
     else
       render :new
     end
   end
   def edit
     @labels = Label.all.map { |label| [label.name, label.id.to_s] }
   end
   def update
     selected_labels = Label.in(id: params["checked_labels"].try(:values))
     @article.labels << selected_labels
     if @article.update(article_params)
       redirect_to articles_path
     else
       render :edit
     end
   end

   def add_vote
    @article = Article.find(params[:id])
    @article.vote += 2
    @article.save
    redirect_to articles_path
   end

   def destroy
     @article.destroy
     redirect_to articles_path
   end
   def show
   end
   private
   def article_params
     params.require(:article).permit(:title, :content, :from, :url, :read_number, :image, :vote)
   end
 end
