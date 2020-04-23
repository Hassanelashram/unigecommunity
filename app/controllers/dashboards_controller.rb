class DashboardsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :confirm_admin, only: [:index]
  def index
    @categories = Category.all
    @users = User.all
    @posts = Post.all
    @topics = Topic.all
    @opinions = Opinion.all
    @categories = Category.where(parent_id: nil).order('category ASC')
  end

end
