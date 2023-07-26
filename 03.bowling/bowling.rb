#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

shots = scores.map { |s| s == 'X' ? [10, 0] : s.to_i }.flatten

frames = shots.each_slice(2).to_a

accumulated_bonus_points = 0
frames.each_with_index do |frame, frame_number|
  if frame.sum == 10
    accumulated_bonus_points += if frame.last.zero?
                                  if frames[frame_number + 1].last.zero? && frames[frame_number + 1].sum == 10
                                    frames[frame_number + 1][0] + frames[frame_number + 2][0]
                                  else
                                    frames[frame_number + 1].sum
                                  end
                                else
                                  frames[frame_number + 1][0]
                                end
  end
  break if frame_number == 8
end

puts shots.sum + accumulated_bonus_points
