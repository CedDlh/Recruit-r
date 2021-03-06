class PositionsController < ApplicationController


  def index
  @positions = Position.all
  end

  def new
    @position = Position.new
  end

  def show
   @position = Position.find(params[:id])
  end

  def create
    @position = Position.new(position_params)
    @position.save
    redirect_to root_path
  end

 private

  def position_params
    params.require(:position).permit(:name, :skill)
  end
end
