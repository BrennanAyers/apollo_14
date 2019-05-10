require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class methods' do
    before :each do
      @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @logan = Astronaut.create!(name: "Logan Armstrong", age: 14, job: "Janitor")
      @alex = Astronaut.create!(name: "Alex Armstrong", age: 25, job: "Chef")
    end

    it 'should return the average age of collection of Astronauts' do
      expect(Astronaut.average_age).to eq(25.333333)
    end
  end
end
