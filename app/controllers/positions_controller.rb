class PositionsController < ApplicationController

 def create
   #position_params['skill'] = position_params['skill'].split(",")
   @position = Position.new(position_params)
   #@position.name = params
   @position.save
 end




 private

  def position_params
    params.require(:position).permit(:name, :skill)
  end
end
