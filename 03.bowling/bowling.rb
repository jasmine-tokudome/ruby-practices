#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

accumulated_bonus_points = 0
frames.each_with_index do |n, idx|
  if n.sum == 10
    accumulated_bonus_points += if n.last.zero?
                                  if frames[idx + 1].last.zero? && frames[idx + 1].sum == 10 && idx + 2 < 9
                                    frames[idx + 1][0] + frames[idx + 2][0]
                                  else
                                    frames[idx + 1].sum
                                  end
                                else
                                  frames[idx + 1][0]
                                end
  end
  break if idx == 8
end

# 9回と10回の1投目がストライクの場合は、10回目の2投目のスコアを加算する。
accumulated_bonus_points += frames[10].first if frames[8] == [10, 0] && frames[9] == [10, 0]

# 9回目まですべてストライクで10回目が0点ではない場合は10点加算する
accumulated_bonus_points += 10 if frames.all? { |frame| frame == [10, 0] } && frames[9].sum != 0

puts shots.sum + accumulated_bonus_points
