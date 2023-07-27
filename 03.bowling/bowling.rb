#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

shots = scores.flat_map { |s| s == 'X' ? [10, 0] : s.to_i }

frames = shots.each_slice(2).to_a

PERFECT_SCORE = 10

accumulated_bonus_points = 0
frames.each_with_index do |frame, frame_number|
  if frame.sum == PERFECT_SCORE
    accumulated_bonus_points += if frame.last.zero?
                                  if frames[frame_number + 1].last.zero? && frames[frame_number + 1].sum == PERFECT_SCORE
                                    frames[frame_number + 1][0] + frames[frame_number + 2][0]
                                  else
                                    frames[frame_number + 1].sum
                                  end
                                else
                                  frames[frame_number + 1][0]
                                end
  end
  break if frame_number == 8 # ボーナスポイントの加算があるのは9回目までのため。
end

puts shots.sum + accumulated_bonus_points
