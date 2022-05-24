class ToysController < ApplicationController
  before_action :select_toy, only: %i[show]

  def index
    @toys = Toy.all
  end

  def show
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
    @toy.save
    redirect_to toy_path(@toy)
  end

  private

  def select_toy
    @toy = Toy.find(params[:id])
  end

  def toy_params
    params.require(:toy).permit(:name, :description, :cuteness, :kid_friendly, :price_daily, :location)
  end
end
