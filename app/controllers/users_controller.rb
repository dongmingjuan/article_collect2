class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
     @users = User.all.page params[:page]
     @users = @users.where(email: /#{params[:email]}/) unless params[:email].blank?
     @users = @users.where(username: /#{params[:username]}/) unless params[:username].blank?
  end

  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def activeall
    User.update_all(active: true)
    redirect_to  users_path
  end

  def unactiveall
    User.update_all(active: false)
    redirect_to  users_path
  end

  def active
    @user = User.find(params[:id])
    @user.update(active: true)
    redirect_to users_path
  end

  def unactive
    @user = User.find(params[:id])
    @user.update(active: false)
    redirect_to users_path
  end

  def sign_in
    @user = User.find(params[:id])
    if @user.sign
      flash[:notice] = "aaaa"
    else
      flash[:notice] = "xxxx"
    end
    redirect_to articles_path(page: params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :userphoto, :role)
  end
end
