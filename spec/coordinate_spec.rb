require 'spec_helper'


describe Rover::Coordinate do

  describe 'after initialization' do
    it "has an x coordinate" do
      coordinate = Rover::Coordinate.new(1, 3)
      expect(coordinate.x).to be == 1
    end

    it "has an y coordinate" do
      coordinate = Rover::Coordinate.new(1, 3)
      expect(coordinate.y).to be == 3
    end
  end

  describe '#valid?' do
    it "is true when the x and y are greater than or equal to 0" do
      coordinate = Rover::Coordinate.new(1, 1)
      expect(coordinate.valid?).to be true
    end

    it "is false when the x coordinate is less than 0" do
      coordinate = Rover::Coordinate.new(-1, 1)
      expect(coordinate.valid?).to be false
    end

    it "is false when the y coordinate is less than 0" do
      coordinate = Rover::Coordinate.new(1, -1)
      expect(coordinate.valid?).to be false
    end
  end

  it "#east will return a new coordinate with the same y, but an x that is one greater" do
    coordinate = Rover::Coordinate.new(3,3)
    eastern_coordinate = coordinate.east
    expect(eastern_coordinate.x).to be == 4
    expect(eastern_coordinate.y).to be == 3
  end

  it "#west will return a new coordinate with the same y, but an x that is one less" do
    coordinate = Rover::Coordinate.new(3,3)
    eastern_coordinate = coordinate.west
    expect(eastern_coordinate.x).to be == 2
    expect(eastern_coordinate.y).to be == 3
  end

  it "#south will return a new coordinate with one less in the y direction, but an x is same" do
    coordinate = Rover::Coordinate.new(3,3)
    eastern_coordinate = coordinate.south
    expect(eastern_coordinate.x).to be == 3
    expect(eastern_coordinate.y).to be == 2
  end

  it "#north will return a new coordinate with one greater in the y direction, but an x is same" do
    coordinate = Rover::Coordinate.new(3,3)
    eastern_coordinate = coordinate.north
    expect(eastern_coordinate.x).to be == 3
    expect(eastern_coordinate.y).to be == 4
  end

  describe '#==' do
    context "when X(&Y) of one coordinate == X(&Y) of another coordinate" do
      it "coordinate at (3,3) should == coordinate at (3,3)" do
        coordinate = Rover::Coordinate.new(3,3)
        another_coordinate = Rover::Coordinate.new(3,3)
        expect(coordinate == another_coordinate).to be true
      end
      it "coordinate at (3,3) should != coordinate at (3,4)" do
        coordinate = Rover::Coordinate.new(3,3)
        another_coordinate = Rover::Coordinate.new(3,4)
        expect(coordinate == another_coordinate).to be false
      end
    end
    # look at tests for Card and try to reproduce == tests
  end
end
