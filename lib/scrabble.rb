require 'pry'
class Scrabble

  def score(word)
    word.upcase.chars.map do |letter|
      point_values[letter]
    end.reduce(:+)
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score_with_multipliers(word, square_values, word_multiply = 1)
    word_array = word.upcase.chars.map! do |letter|
        point_values[letter]
    end
    n=0
    values = []
    while n < word.length
      values << word_array[n] * square_values[n]
      n+=1
    end
    if word.length == 7
      (values.reduce(:+)+10)*word_multiply
    else
      values.reduce(:+)*word_multiply
    end
  end

  def highest_scoring_word (words)
    highest_word = words.group_by do |word|
      score(word)
    end
    if highest_word.max[1].count > 1 && highest_word.max[1].any? {|word| word.length ==7}
      seven_letters = highest_word.max[1].find {|word| word.length ==7}
      seven_letters
    elsif highest_word.max[1].count > 1
      highest_word.max[1].min_by {|word| word.length}
    elsif highest_word.max[1].count > 1 && highest_word.max[1].all? {|word| word.length}
      highest_word.max[1][0]
    else
      highest_word.max[1].join
    end
  end

end
