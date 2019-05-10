require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe 'When I visit the Astronaut index page' do
    before :each do
      @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @logan = Astronaut.create!(name: "Logan Armstrong", age: 14, job: "Janitor")
      @alex = Astronaut.create!(name: "Alex Armstrong", age: 25, job: "Chef")
    end
    it 'I see a list of astronauts with their info' do
      visit astronauts_path

      within("#astronaut-#{@neil.id}") do
        expect(page).to have_content("Name: #{@neil.name}")
        expect(page).to have_content("Age: #{@neil.age}")
        expect(page).to have_content("Job: #{@neil.job}")
      end

      within("#astronaut-#{@logan.id}") do
        expect(page).to have_content("Name: #{@logan.name}")
        expect(page).to have_content("Age: #{@logan.age}")
        expect(page).to have_content("Job: #{@logan.job}")
      end

      within("#astronaut-#{@alex.id}") do
        expect(page).to have_content("Name: #{@alex.name}")
        expect(page).to have_content("Age: #{@alex.age}")
        expect(page).to have_content("Job: #{@alex.job}")
      end
    end

    it 'I see the average age of listed Astronauts' do
      visit astronauts_path

      expected = (@neil.age + @alex.age + @logan.age) / 3

      expect(page).to have_content("Average Age: #{expected}")
    end
  end
end
