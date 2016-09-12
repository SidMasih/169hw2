class HangpersonGame

  attr_accessor :word, :guesses, :wrong_guesses, :mutableword
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize(word)
    @word = word
    @mutableword = word
    @guesses = ""
    @wrong_guesses = ""
  end

  def guess(letter)
    letter = letter.downcase
    if (@guesses.include?(letter) or @wrong_guesses.include?(letter))
      
      return false
    elsif (@mutableword.include?(letter) or @mutableword.include?(letter)) 
      @guesses = @guesses + letter
       @mutableword = @mutableword.tr(letter, '')
      return true
    else
      @wrong_guesses = @wrong_guesses + letter
      return true
    end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
