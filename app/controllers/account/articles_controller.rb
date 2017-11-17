class Account::ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = current_user.articles.where(favorate: true)
  end
end
