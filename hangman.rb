require 'yaml'

class Hangman
  
  def initialize
    @attempts = 6
    @correct_letters = []
    @incorrect_letters = []
    @choice_the_word = ''
    @word_state = ''
    
  end

  def initial_screen
    puts ""
    puts " _ _ _ _ _ _ _ _ _ _ THE HANGMAN C.L.I. _ _ _ _ _ _ _ _ _ _"
    puts ""
    puts "A project developed by GustavoLVJardim to The Odin Project -"
    puts "A Ruby Fullstack Course."
    puts ""
    puts "What you want to do:
    - Press 'N' to play a new game.
    - Press 'C' to load a saved game."
        
    input_user = gets.chomp.downcase
    
    if input_user == "c"
      load_game
    else
      new_game
    end
    puts ""
    puts ""
  end

  def new_game
    filter_words = []

    File.open('words.txt', 'r') do |file|
      file.each_line do |line|
        word = line.chomp
        
        if word.length > 4 && word.length < 13
          filter_words << word
        end
      end
    end
    @choice_the_word = filter_words.sample.downcase.strip
    @word_state = "_ " * @choice_the_word.length

  
    loop_game
  
  end

  def loop_game
    while @attempts > 0 && @word_state.include?("_")
      puts @word_state
      puts @incorrect_letters
      puts "Remaing Attempts: #{@attempts}"
      puts "Type a letter or type 'save' to save the game."

      input_user = gets.chomp.downcase

      if input_user == "save"
        save_game
        puts "Game saved with sucess!"
      else
        process_attempt(input_user)
      end
    end

    if @word_state.include?("_")
      puts "You lose! The word was: #{@choice_the_word}"
    else
      puts "You win! The word was: #{@choice_the_word}"
    end
  end

  def process_attempt(letter_input)
    letter_input = letter_input.downcase

    if @correct_letters.include?(letter_input) or @incorrect_letters.include?(letter_input)
      puts "You already guessed this letter."
    
    elsif @choice_the_word.include?(letter_input)
      @correct_letters << letter_input
      @choice_the_word.chars.each_with_index do |char, index|
        @word_state[index * 2] = letter_input if char == letter_input
      end
    
    else
      @incorrect_letters << letter_input
      @attempts -= 1
    end
  end

  def save_game
    game_data = {
      attempts: @attempts,
      correct_letters: @correct_letters,
      incorrect_letters: @incorrect_letters,
      choice_the_word: @choice_the_word,
      word_state: @word_state
    }
  
    File.open('save_game.yaml', 'w') do |file|
      file.puts YAML.dump(game_data)
    end
  end
  

  def load_game
    if File.exist?('save_game.yaml')
      File.open('save_game.yaml', 'r') do |file|
        game_data = YAML.load(file)
  
        @attempts = game_data[:attempts]
        @correct_letters = game_data[:correct_letters]
        @incorrect_letters = game_data[:incorrect_letters]
        @choice_the_word = game_data[:choice_the_word]
        @word_state = game_data[:word_state]
      end
  
      puts "Game loaded successfully!"
      loop_game
    else
      puts "There is no saved game. Starting a new game..."
      new_game
    end
  end
  




end

game = Hangman.new
game.initial_screen
game.new_game