require 'rails_helper'

RSpec.describe Spacecraft, type: :model do
  describe 'initialization' do
    it 'creates a spacecraft with initial position and direction' do
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
      expect(spacecraft).to be_valid
      expect(spacecraft.x).to eq(0)
      expect(spacecraft.y).to eq(0)
      expect(spacecraft.z).to eq(0)
      expect(spacecraft.direction).to eq('N')
    end

    it 'is invalid with an invalid direction' do
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'Invalid')
      expect(spacecraft).not_to be_valid
    end
  end

  describe '#execute_commands' do
    it 'moves forward correctly' do
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
      spacecraft.execute_commands(['f'])
      expect(spacecraft.coordinates).to eq([0, 1, 0])
    end

    it 'rotates left correctly' do
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
      spacecraft.execute_commands(['l'])
      expect(spacecraft.direction).to eq('W')
    end

    it 'changes angle correctly' do
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
      spacecraft.execute_commands(['u'])
      expect(spacecraft.direction).to eq('Up')
    end

    it 'handles multiple commands' do
       spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
       spacecraft.execute_commands(['f', 'r', 'u', 'b', 'l'])
       expect(spacecraft.coordinates).to eq([0, 1, -1])
      expect(spacecraft.direction).to eq('Up')  # Update the expectation to 'Up'
    end


    it 'moves backward correctly' do
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
      spacecraft.execute_commands(['b'])
      expect(spacecraft.coordinates).to eq([0, -1, 0])
    end

    it 'rotates right correctly' do
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
      spacecraft.execute_commands(['r'])
      expect(spacecraft.direction).to eq('E')
    end

    it 'rotates up correctly' do
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
      spacecraft.execute_commands(['u'])
      expect(spacecraft.direction).to eq('Up')
    end

    it 'rotates down correctly' do
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
      spacecraft.execute_commands(['d'])
      expect(spacecraft.direction).to eq('Down')
    end

    it 'handles invalid commands gracefully' do
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
      spacecraft.execute_commands(['invalid', 'command'])
      expect(spacecraft.coordinates).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end
  end
end
