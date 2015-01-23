module Hangman
  class Word
    attr_reader :to_guess, :result, :incorrect

    def initialize
      @to_guess = random_word
      @result = '_' * @to_guess.size
      @incorrect = []
    end

    def play(letter)
      if to_guess.include?(letter)
        add_to_result(letter)
        true
      else
        add_to_incorrect(letter)
        false
      end
    end

    def display
      puts "Word:\t\t#{result.split('').join(' ')}"
      puts "Incorrect:\t#{incorrect.sort.join(', ')}"
    end

    def correct?
      result == to_guess
    end

    private

    def add_to_result(letter)
      to_guess.split('').each_with_index { |e, i| result[i] = letter if e == letter }
    end

    def add_to_incorrect(letter)
      incorrect.push(letter)
    end

    def random_word
      dictionary = File.read('./5desk.txt').split
      dictionary.select { |word| word.size.between?(5, 12) }.sample.downcase
    end
  end
end
