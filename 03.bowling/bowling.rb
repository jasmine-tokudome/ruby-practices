#!/usr/bin/env ruby

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

p shots

frames = []
shots.each_slice(2) do |s|
  frames << s
end

p frames

accumulated_bonus_points = 0
frames.each_with_index do |n, idx|
  if n.sum == 10
     if n.last == 0
      if frames[idx+1].last == 0 && frames[idx+1].sum == 10 && idx + 2 < 9
      accumulated_bonus_points += frames[idx+1].first + frames[idx+2].first
      else
        accumulated_bonus_points += frames[idx+1].sum
      end
     else
      accumulated_bonus_points += frames[idx+1].first
     end
     break if idx == 8
  end
end

# 9回と10回の1投目がストライクの場合は、10回目の3投目のスコアを加算する。
if frames[8].sum == 10 && frames[8].last == 0 && frames[9].sum == 10 && frames[9].last == 0
  accumulated_bonus_points += frames[10].first
end

# 9回目まですべてストライクで10回目が0点ではない場合は10点加算する
if frames.all? { |frame| frame.last == 0 && frame.sum == 10 } && frames[9].sum != 0 
  accumulated_bonus_points += 10
end

p accumulated_bonus_points
p shots.sum + accumulated_bonus_points