require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe 'When I visit the Astronaut index page' do
    before :each do
      @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @logan = Astronaut.create!(name: "Logan Armstrong", age: 14, job: "Janitor")
      @alex = Astronaut.create!(name: "Alex Armstrong", age: 25, job: "Chef")

      @capricorn_4 = @neil.missions.create!(title: "Capricorn 4", time_in_space: 280)
      @apollo_13 = @neil.missions.create!(title: "Apollo 13", time_in_space: 43)
      @gemini_7 = @neil.missions.create!(title: "Gemini 7", time_in_space: 55)

      @logan.missions << @gemini_7
      @logan.missions << @capricorn_4

      @lost = @alex.missions.create!(title: "Lost on Mars", time_in_space: 5067)
      @alex.missions << @apollo_13
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

      expected = (@neil.age + @alex.age + @logan.age) / 3.0

      expect(page).to have_content("Average Age: #{expected.round(2)}")
    end

    it 'I see the missions for each Astronaut alphabetically' do
      visit astronauts_path

      within("#astronaut-#{@neil.id}-missions") do
        expect(page).to have_content("#{@apollo_13.title}")
        expect(page).to have_content("#{@capricorn_4.title}")
        expect(page).to have_content("#{@gemini_7.title}")
      end

      within("#astronaut-#{@logan.id}-missions") do
        expect(page).to have_content("#{@capricorn_4.title}")
        expect(page).to have_content("#{@gemini_7.title}")
      end

      within("#astronaut-#{@alex.id}-missions") do
        expect(page).to have_content("#{@apollo_13.title}")
        expect(page).to have_content("#{@lost.title}")
      end
    end
  end
end
