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

what_day = first_day.strftime('%a') # 1日の曜日

# start_atはカレンダーで「1」が表示される位置
if what_day == "Sun"
  start_at = 0
elsif what_day == "Mon"
  start_at = 1
elsif what_day == "Tue"
  start_at = 2
elsif what_day == "Wed"
  start_at = 3
elsif what_day == "Thu"
  start_at = 4
elsif what_day == "Fri"
  start_at = 5
else what_day == "Sat"
  start_at = 6
end

days_num = last_day - first_day +1
days = days_num.to_i #当月の日数

days_total = days + start_at # 開始日までの空白(スペース)と当月の日数の合計

day_of_week= "\n 日 月 火 水 木 金 土 \n"

title =  "  #{first_day.month}月 #{first_day.year}  "
print title.to_s.center(22)

day_of_week= "\n 日 月 火 水 木 金 土 \n"
print day_of_week # 曜日

today_date = Date.today #反転させる必要があるか調べるための準備
just_today = today_date.day.to_i
required_year = first_day.year.to_i
required_month = first_day.month.to_i
retuen_date = Date.new(required_year,required_month,just_today)

(1..days_total).each do | cal |
  if
    cal <= start_at
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

