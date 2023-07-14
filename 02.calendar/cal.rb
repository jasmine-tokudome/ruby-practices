#!/usr/bin/env ruby

require 'date'
require 'optparse'

params = ARGV.getopts("y:m:")

input_year = params["y"].to_i #入力した年
input_month = params["m"].to_i #入力した月

today_date = Date.today

if input_year == 0 && input_month == 0
  this_year = today_date.year # 今年
  this_month = today_date.month #今月
  first_day = Date.new(today_date.year,today_date.month,1) #今月1日
  last_day = Date.new(today_date.year,today_date.month,-1) #今月末日
elsif input_year == 0 && input_month != 0 
  this_year = today_date.year
  first_day = Date.new(this_year,input_month,1)
  last_day = Date.new(this_year,input_month,-1)
else
  first_day = Date.new(input_year,input_month,1)
  last_day = Date.new(input_year,input_month,-1)
end

# 1日の曜日を取得する。start_atはカレンダーで「1」が表示される位置になる
start_at = first_day.wday

#当月の日数
days = last_day.day

days_total = days + start_at # 開始日までの空白(スペース)と当月の日数の合計

week_labels= "\n 日 月 火 水 木 金 土 "

title =  "#{first_day.month}月#{first_day.year}"
print title.to_s.center(22)

puts week_labels # 曜日

today_date = Date.today #反転させる必要があるか調べるための準備
just_today = today_date.day.to_i
required_year = first_day.year.to_i
required_month = first_day.month.to_i
retuen_date = Date.new(required_year,required_month,just_today)

(1..days_total).each do | cal |
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

