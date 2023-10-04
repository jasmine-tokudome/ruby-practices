require_relative 'shot'
require_relative 'frame'

class Game

  PERFECT_SCORE = 10

  def make_frame_instances(input_marks)
    @frames ||= begin
                  frames = []
                  shot = Shot.new(input_marks)
                  shot.convert_marks_to_scores.each_slice(2) do |first_shot, second_shot|
                    frames << Frame.new(first_shot, second_shot)
                  end
                  if shot.convert_marks_to_scores.length % 2 == 1
                    last_shot = shot.convert_marks_to_scores.last
                    frames[9].instance_variable_set(:@third_shot, Shot.new(last_shot))
                    frames.pop
                  end
                  frames
                end
  end

  def calculate_normal_score(input_marks)
    frames = make_frame_instances(input_marks)
    normal_score = frames.map { |frame| frame.calculate_1frame_score }.sum
    normal_score
  end

  def calculate_bonus_score(input_marks)
    accumulated_bonus = 0
    frames = make_frame_instances(input_marks)
    frames.each do |frame|
      if frame.calculate_1frame_score == PERFECT_SCORE
        accumulated_bonus += if frame.second_shot.mark.zero?
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
    accumulated_bonus
  end
end
