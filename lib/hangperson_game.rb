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
    @guesses_left = 7
  end

  def guess(letter)
    if(letter == nil or letter.length == 0 or letter[/[a-zA-Z]+/]  != letter )
      raise ArgumentError, "bad args"
    end


    letter = letter.downcase
    if (@guesses.include?(letter) or @wrong_guesses.include?(letter))
      
      return false
    elsif (@mutableword.include?(letter) or @mutableword.include?(letter)) 
      @guesses = @guesses + letter
      @mutableword = @mutableword.tr(letter, '')
      return true
    else
      @guesses_left = @guesses_left - 1
      @wrong_guesses = @wrong_guesses + letter
      return true
    end
  end

  def word_with_guesses
    myword = @word
    wordarray = @word.split("")

    for i in wordarray
      if(!@guesses.include?(i))
        myword = myword.tr(i,"-")
      end
    end

    return myword
    
  end

  def check_win_or_lose
    if(@guesses_left <= 0)
      return :lose
    elsif (@mutableword.length ==0)
      return :win
    else 
      return :play
    end
      

  end


  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
