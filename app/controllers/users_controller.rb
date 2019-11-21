class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_current_user, only: [:edit, :update, :dashboard, :list_readings, :list_hostings, :list_books]
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
    @readings = get_readings
    @hostings = get_hostings
    @no_readings = @readings.count
    @no_hostings = @hostings.count
    @no_books = @user.books.count

  end

  def list_readings
    @readings = get_readings
  end

  def list_hostings
    @hostings = get_hostings
  end

  def list_books
    @books = @user.books
  end

  private

  def set_current_user
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :language, :description, :location, :profile_pic)
  end

  def get_readings
    @user.rentals
  end
  def get_hostings
    @books = @user.books
    @rentals_host = []
    @books.each do |book|
      book.rentals.each { |rental| @rentals_host << rental }
    end
    @rentals_host
  end
end
