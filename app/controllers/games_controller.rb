require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)
    if @included && @english_word
      @points = params[:word].length.to_i
    end
  end

private

  def included?(word, letters)
  end

  def english_word?(word)
    response = URI.open("https://dictionary.lewagon.com/#{word}")
    JSON.parse(response.read)
  end
end
