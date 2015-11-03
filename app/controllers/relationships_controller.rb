class RelationshipsController < ApplicationController
  before_action :load_user, :require_login, only: :index

  def index
    send params[:type]
  end

  def create
    @user = User.find params[:followed_id]
    current_user.follow @user
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow @user
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  private
  def following
    @title = :Following
    @users = @user.following.paginate page: params[:page]
  end

  def followers
    @title = :Followers
    @users = @user.followers.paginate page: params[:page]
  end

  def load_user
    @user = User.find_by(id: params[:user_id]) ||
      User.find_by(slug: params[:user_id])
  end
end
