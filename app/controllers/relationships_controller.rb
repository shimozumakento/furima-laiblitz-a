class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only:[:index,:show]

  def index
    @followings = current_user.followings
    @followers = current_user.followers
  end

  def show
    @user=User.find(params[:id])
    @nickname = @user.nickname
    @products = Product.where(user_id: @user.id)
  end

  def create
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_back(fallback_location: root_path)
  end
end

