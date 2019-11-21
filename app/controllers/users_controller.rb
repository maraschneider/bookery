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

  def dashboard
    @readings = list_readings
    @hostings = list_hostings
  end

  private

  def set_current_user
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :language, :description, :location, :profile_pic)
  end

  def list_readings
    current_user.rentals
  end

  def list_hostings
    @books = current_user.books
    @rentals_host = []
    @books.each do |book|
      book.rentals.each { |rental| @rentals_host << rental }
    end
    return @rentals_host
  end
end
