require 'optparse'
require_relative 'shot'
require_relative 'frame'
require_relative 'game'

PERFECT_SCORE = 10

# Game.play(input_scores)
# game = Game.new
# game.play(input_scores)

def convert_mark_to_score
  input_marks = ARGV[0]
  add_0_after_markX = input_marks.gsub(/X/, 'X,0')
  modified_scores = add_0_after_markX.gsub(/(?<=.{19})X0/, 'X')
  modified_scores.split(",").map do |mark|
    Shot.new(mark).score
  end
end

def make_frame_instances
  @frames ||= begin
                frames = []
                convert_mark_to_score.each_slice(2) do |first_shot, second_shot|
                  frames << Frame.new(first_shot, second_shot)
                end
                if convert_mark_to_score.length % 2 == 1
                  last_shot = convert_mark_to_score.last
                  frames[9].instance_variable_set(:@third_shot, Shot.new(last_shot))
                  frames.pop
                end
                frames
              end
end

def calcurate_bonus_point
accumulated_bonus_points = 0
frames = make_frame_instances
frames.each do |frame|
  if frame.score == PERFECT_SCORE
    accumulated_bonus_points += if frame.second_shot.mark.zero?
                                  if frames[frame.frame_number].first_shot.mark == PERFECT_SCORE
                                    frames[frame.frame_number].first_shot.mark + frames[frame.frame_number + 1].first_shot.mark
                                  else
                                    frames[frame.frame_number].first_shot.mark + frames[frame.frame_number].second_shot.mark
                                  end
                                else
                                  frames[frame.frame_number].first_shot.mark
                                end
  end
  break if frame.frame_number == 9
end
accumulated_bonus_points
end

total_scores = make_frame_instances.map { |frame| frame.score }
total_score = total_scores.sum

pp total_score + calcurate_bonus_point
