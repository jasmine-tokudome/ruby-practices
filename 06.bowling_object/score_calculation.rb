require 'optparse'
require_relative 'game'

input_marks = ARGV[0]
game = Game.new
puts game.calculate_normal_score(input_marks) + game.calculate_bonus_score(input_marks)
