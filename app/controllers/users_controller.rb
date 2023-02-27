class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
