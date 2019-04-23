class PositionsController < ApplicationController


  def index
  @positions = Position.all

  end

  def show
   @position = Position.find(params[:id])
  end

  def create
    @position = Position.new(position_params)
    @position.save
  end

 private

  def position_params
    params.require(:position).permit(:name, :skill)
  end
end
