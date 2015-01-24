module Hangman

  class Game
    def initialize(player)
      @player = player
      @word = Word.new
      @attempt = 0
      @max_moves = 8
    end

    def run
      loop do
        @word.display
        show_hangman
        solicit_move
        letter = @player.guess
        if letter == 'load'
          if File.exists?('saved_game')
            load_game
            puts 'Game loaded'
          else
            puts 'No file to load'
          end
        elsif letter == 'save'
          save_game
          puts 'Game saved'
        elsif letter == 'quit'
          puts 'Thanks for playing. Bye!'
          break
        else
          guessed = @word.play(letter)
          if @word.correct?
            puts "Correct! The word is #{@word.to_guess}. You've won!"
            break
          elsif @attempt == @max_moves - 1
            puts "You've lost. The correct word is: #{@word.to_guess}"
            break
          end
          @attempt += 1 unless guessed
        end
      end
    end

    private

    def solicit_move
      puts "#{@player.name}, guess a letter:"
    end

    def show_hangman
      puts "Hangman:\t|" + 'x' * @attempt + "." * (@max_moves - @attempt) + '|'
    end

    def load_game
      store = PStore.new('saved_game')
      store.transaction do
        @word = store[:word]
        @player = store[:player]
        @attempt = store[:attempt]
        @max_moves = store[:max_moves]
      end
    end

    def save_game
      store = PStore.new('saved_game')
      store.transaction do 
        store[:word] = @word
        store[:player] = @player
        store[:attempt] = @attempt
        store[:max_moves] = @max_moves
      end
    end
  end
end
