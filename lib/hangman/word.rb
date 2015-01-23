module Hangman
  class Word
    attr_reader :result, :incorrect_letters

    def initialize
      @word_to_guess = random_word
      @result = '_' * @word_to_guess.size
      @incorrect_letters = []
    end

    def play(letter)
      @word_to_guess.include?(letter) ? add_to_result(letter) : add_to_incorrect_letters(letter)
      feedback
    end

    private

    def feedback
      "#{result.split('').join(' ')}\tincorrect: #{incorrect_letters.sort.join(', ')}"
    end

    def add_to_result(letter)
      @word_to_guess.split('').each_with_index { |e, i| result[i] = letter if e == letter }
    end

    def add_to_incorrect_letters(letter)
      incorrect_letters.push(letter)
    end

    def random_word
      dictionary = File.read('./5desk.txt').split
      dictionary.select { |word| word.size.between?(5, 12) }.sample.downcase
    end
  end
end
