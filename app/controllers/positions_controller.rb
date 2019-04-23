class PositionsController < ApplicationController

  def create
    @position = Position.new(position_params)
    @position.save
  end

 private

  def position_params
    params.require(:position).permit(:name, :skill)
  end
end
