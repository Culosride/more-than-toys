class BookingsController < ApplicationController
  before_action :select_toy, only: %i[new create]

  def new
    @booking = Booking.new
    authorize @booking
  end

    def show
      authorize @booking
    end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if current_user != @toy.user
      @booking.toy = @toy
      @booking.price = @toy.price_daily * rand(3..10)
      authorize @booking
      @booking.save
      redirect_to dashboard_path
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    @toy = Toy.find(@booking[:toy_id])
    redirect_to dashboard_path(current_user), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date, :toy_id, :current_user)
  end

  def select_toy
    @toy = Toy.find(params[:toy_id])
  end
end
