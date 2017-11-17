class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    def new
      @comment = Comment.new
    end
    def create
      @comment = Comment.new(comment_params)
      @comment.article = @article
      @comment.user = current_user
      @comment.save
      redirect_to article_path(@article)
    end
    def edit
     @comment = Comment.find(params[:id])
    end
    def update
     @comment = Comment.find(params[:id])
     if @comment.update(comment_params)
       redirect_to account_comments_path
     else
       render :edit
     end
    end
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to account_comments_path
    end
    private
    def comment_params
      params.require(:comment).permit(:content)
    end
    def set_user
      @article = Article.find(params[:article_id])
    end
end
