require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe 'When I visit the Astronaut index page' do
    before :each do
      @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @logan = Astronaut.create!(name: "Logan Armstrong", age: 14, job: "Janitor")
      @alex = Astronaut.create!(name: "Alex Armstrong", age: 25, job: "Chef")
    end
    it 'I see a list of astronauts with their info' do

    end
  end
end
