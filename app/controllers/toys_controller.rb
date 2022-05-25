class ToysController < ApplicationController
  before_action :select_toy, only: %i[show]

  def index
    @toys = policy_scope(Toy)
  end

  def show
    authorize @toy
  end

  def new
    @toy = Toy.new
    authorize @toy
  end

  def create
    @toy = Toy.new(toy_params)
    @toy.user = current_user
    authorize @toy
    @toy.save
    redirect_to toy_path(@toy)
  end

  # def edit
  #   authorize @toy
  #   @toy.user = current_user
  # end

  # def update
  #   authorize @toy
  # end

  # def destroy
  #   authorize @toy
  # end

  private

  def select_toy
    @toy = Toy.find(params[:id])
  end

  def toy_params
    params.require(:toy).permit(:name, :description, :cuteness, :soul_taking_chance, :kid_friendly, :price_daily, :location)
  end
end
