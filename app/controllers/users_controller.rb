class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tips = User.find(params[:id]).tips.order(updated_at: :DESC)
  end
end
