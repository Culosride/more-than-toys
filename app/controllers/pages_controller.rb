class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def dashboard
    @toys = current_user.toys
    @bookings = current_user.bookings
    # @bookedtoys = bookings.toys
  end

  def mytoys
    @toys = current_user.toys
    @bookings = current_user.bookings
  end

end
