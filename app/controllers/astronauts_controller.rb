class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @average_age = @astonauts.average_age
  end
end
