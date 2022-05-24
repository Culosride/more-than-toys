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
    raise
    redirect_to toy_booking_path(@booking)
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
    params.require(:booking).permit(:price, :start_date, :toy_id, :current_user)
  end

  def select_toy
    @toy = Toy.find(params[:toy_id])
  end
end
