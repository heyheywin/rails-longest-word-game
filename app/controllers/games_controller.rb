class GamesController < ApplicationController
  require 'open-uri'
  require 'json'

  def new
    # @new = params[:new]
    @new = (0...10).map { (65 + rand(26)).chr }
  end

  def score
    @input = params[:input]
    @arrayinput = @input.split
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    json_content = open(url).read
    english_words = JSON.parse(json_content)
    @evaluate = english_words['found']
    @newword = @word.chars
    if  @evaluate == false
      @result = "not word"
    elsif
        @newword.all? { |letter| @newword.count(letter) > @arrayinput.count(letter) }
      @result = "not among letters"
    else
      @result = "congrats"
    end

    # @newword.each do |el|
      # @arrayinput.include?(el)




    # @result = @newword.all? do |e|
     # @input.delete(e)






    # @result = {}
    # @result[:found]
    # @result[:score]
    # @result[:message]
    # if english_words["found"] == @word
    #   return @result[:score]
    # end
  end
end
