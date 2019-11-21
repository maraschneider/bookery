class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_current_user, only: [:edit, :update, :dashboard]
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to rentals_path
    else
      render 'edit'
    end
  end


  private

  def set_current_user
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :language, :description, :location, :profile_pic)
  end
end
