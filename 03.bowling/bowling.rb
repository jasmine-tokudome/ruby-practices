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
binding.break

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.each do |frame|
  if frame[0] == 10 # strike
    point += 30
  elsif frame.sum == 10 # spare
    point += frame[0] + 10
  else
    point += frame.sum
  end
end
puts point



# (要件)
# 1ゲーム=10フレーム。
# 1フレーム=2投（ストライクの場合は1投）。
# ストライク=1投目で10本倒す。
# スペア=1投目で全て倒せなかった場合、2投目で全て倒す。
# ストライクの場合は2投目はなし。
# スペアは1投目の本数+10点
# ストライクの場合は30点
# ありえない投球数やありえない数字・記号がこない前提。

# (追加要件)以下が新ゲーム特有のルール
# スペアの時は次の１投目まで足す。
# ストライクのときは次の2頭目まで足す。
# 10フレーム目で1当メガストライク、2投目がスペアの場合は3頭目まで投げられる。

# 詳しく条件を考える。

# スペアの時は次の１投目まで足す。
# スペアの時→「elsif frame.sum == 10 」のとき。
# 次の１投目まで足す。
# →次の入力が必要(ここが肝??)
# そのための配列データが有ると良いのかも。

# ストライクのときは次の2頭目まで足す。
# ストライクのとき→ frame[0] == 10
# 次の2頭目まで足す。
# →次のframeまで足す

# 10フレーム目で1当目がストライク、2投目がスペアの場合は3頭目まで投げられる。
# →ここは前半2つの見通しがたったあとに考える。