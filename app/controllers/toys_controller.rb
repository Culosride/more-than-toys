class ToysController < ApplicationController

  #STILL NEEDS BASIC CONTROLLER ACTIONS / refined methods

  def home
    authorize @toy
  end

  def index
    @toys = policy_scope(Toy)
  end

  def show
    #before action thing
    authorize @toy # Add this line
  end

  def new
    #Class instance first by Andrea
    authorize @toy
  end

  def create
    @toy.user = current_user
    authorize @toy
  end

  def edit
    authorize @toy
    @toy.user = current_user
  end

  def update
    authorize @toy
  end

  def destroy
    authorize @toy
  end

private

# def authorize_toy
#   authorize @toy
# end
end
