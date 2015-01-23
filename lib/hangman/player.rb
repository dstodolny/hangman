module Hangman
  class Player
    attr_reader :name
    
    def initialize(name)
      @name = name
    end

    def guess
      loop do
        letter = gets.chomp
        return letter.downcase if letter.match(/^[a-zA-z]$/) || letter == 'load' || letter =='save' || letter == 'quit'
        puts "You can choose only one letter. Try again."
      end 
    end
  end
end
