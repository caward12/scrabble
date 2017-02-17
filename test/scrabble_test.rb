gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_with_square_multipliers
    game = Scrabble.new

    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_score_with_word_multipliers
    game = Scrabble.new

    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_it_can_score_with_seven_word_multipliers
    game = Scrabble.new

    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_it_knows_highest_scoring_word
    game = Scrabble.new
    game2 = Scrabble.new
    game3 = Scrabble.new
    game4 = Scrabble.new

    assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
    assert_equal "word", game2.highest_scoring_word(['hello', 'word', 'sound'])
    assert_equal "silence", game3.highest_scoring_word(['home', 'word', 'silence'])
    assert_equal "word", game4.highest_scoring_word(['hi', 'word', 'ward'])
  end
end
