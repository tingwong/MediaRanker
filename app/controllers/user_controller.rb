class UserController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new(params[:id])
  end

  def create
    @user = User.create(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    user.save

    redirect_to users_path
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to users_path
  end

  private

  def user_params
    return params.require(:user).permit(:username)
  end
end
