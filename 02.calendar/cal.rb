#!/usr/bin/env ruby

require 'date'
require 'optparse'

params = ARGV.getopts("y:m:")

input_year = params["y"].to_i #入力した年
input_month = params["m"].to_i #入力した月

today_date = Date.today

if input_year == 0 && input_month == 0
  manipulated_year = today_date.year # 今年
  this_month = today_date.month #今月
  first_day = Date.new(today_date.year,today_date.month,1) #今月1日
  last_day = Date.new(today_date.year,today_date.month,-1) #今月末日
elsif input_year == 0 && input_month != 0 
  manipulated_year = today_date.year
  first_day = Date.new(manipulated_year,input_month,1)
  last_day = Date.new(manipulated_year,input_month,-1)
else
  first_day = Date.new(input_year,input_month,1)
  last_day = Date.new(input_year,input_month,-1)
end

# 1日の曜日を取得する。start_atはカレンダーで「1」が表示される位置になる
start_at = first_day.wday

#当月の日数
day_count = last_day.day

# 開始日までの空白(スペース)と当月の日数の合計
total_days = day_count + start_at

# カレンダー上部のタイトル
title =  "#{first_day.month}月#{first_day.year}"
print title.to_s.center(22)

# 曜日ラベル
week_labels= "\n 日 月 火 水 木 金 土 "
puts week_labels # 曜日

#反転させる必要があるか調べるための準備
just_today = Date.today.day
retuen_date = Date.new(first_day.year,first_day.month,just_today)

(1..total_days).each do | cal |
  if cal <= start_at
    print "   "
  else
    num = cal - start_at # 当月の日付
    if
      num == just_today && today_date == retuen_date
      num = num.to_s.rjust(3)
      print "\e[7m#{num}\e[0m"
    else
      num = num.to_s.rjust(3)
      print num
    end
  end
  if cal % 7 == 0
    print "\n"
  end
end

print "\n"

