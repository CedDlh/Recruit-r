class PositionsController < ApplicationController

 def create
   @position = Position.new
   @position.name = "Cedric"
   @position.save
 end
end
