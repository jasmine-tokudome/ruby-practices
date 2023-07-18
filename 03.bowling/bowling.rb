#!/usr/bin/env ruby

require 'debug'

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

add_point = 0
frames.each_with_index do |n, idx|
  if n.sum == 10
     if n.last == 0
      add_point += frames[idx+1].sum
     else
      add_point += frames[idx+1].first
     end
     break if idx == 8
  end
end

p add_point
p shots.sum + add_point