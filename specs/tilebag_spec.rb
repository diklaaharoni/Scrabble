require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Tilebag' do
  describe '#initialize' do
    it 'starts with all the default tiles' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.tiles.must_be_kind_of Array
      tile_bag.tiles.each do |tile|
        tile.must_be_kind_of String
        tile.length.must_equal 1
      end
      tile_bag.tiles.length.must_equal 98
    end
  end

  describe 'draw_tiles' do
    it "draws tiles" do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles(1)
      proc {tile_bag.draw_tiles(99)}
    end
  end

  describe 'tiles_remaining' do
    it "returns how many tiles remain in the tile bag" do
    tile_bag = Scrabble::TileBag.new
    tile_bag.draw_tiles(9)
    tile_bag.tiles_remaining.must_equal 89
    end
  end
end
