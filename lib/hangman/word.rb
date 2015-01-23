module Hangman
  class Word
    attr_reader :result

    def initialize
      @word_to_guess = random_word
      @result = '_' * @word_to_guess.size
    end

    def contain?(letter)
      @word_to_guess.include?(letter)
    end

    def add_to_result(letter)
      @word_to_guess.split('').each_with_index { |e, i| result[i] = letter if e == letter }
      result
    end

    private

    def random_word
      dictionary = File.read('./5desk.txt').split
      dictionary.select { |word| word.size.between?(5, 12) }.sample.downcase
    end
  end
end
