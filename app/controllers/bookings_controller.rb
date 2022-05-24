class BookingsController < ApplicationController
  before_action :select_toy, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.toy = @toy
    @booking.save
    redirect_to booking_path(@booking)
    raise
  end

  def show
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    @toy = Toy.find(@booking[:toy_id])
    redirect_to toy_path(@toy), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :toy_id, :user_name)
  end

  def select_toy
    @toy = Toy.find(params[:toy_id])
  end
end
