class DashboardsController < ApplicationController
  before_action :set_user, only: %i[index show edit update]
  # before_action :set_character, only: %i[index show edit update]
  # before_action :set_booking, only: %i[index show edit update]

  def index
    @user = User.find(current_user.id)
    @bookings = Booking.all

  end

  def profile
    @user = User.find(current_user.id)
  end

  def show
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.new
    @user = User.find(current_user.id)
    @user.update(user_params)
  end

  private

  def set_user
    @user = current_user
  end

  # def set_booking
  #   @booking = Booking.find(params[:booking_id])
  # end

  # def set_character
  #   @character = Character.find(params[:character_id])
  # end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :email, :phone_nr, :user_id)
  end
end