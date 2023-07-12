#!/usr/bin/env ruby

require 'date'
require 'optparse'

params = ARGV.getopts("y:m:")

request_year = params["y"].to_i #入力した年

request_month = params["m"].to_i #入力した月

if request_year == 0 && request_month == 0
  now = Date.today
  this_year = now.year # 今年
  this_month = now.month #今月
  first_day = Date.new(now.year,now.month,1) #今月1日
  last_day = Date.new(now.year,now.month,-1) #今月末日
elsif request_year == 0 && request_month != 0
  now = Date.today
  this_year = now.year
  first_day = Date.new(this_year,request_month,1)
  last_day = Date.new(this_year,request_month,-1)
else
  first_day = Date.new(request_year,request_month,1)
  last_day = Date.new(request_year,request_month,-1)
end

what_day = first_day.strftime('%a') # 1日の曜日

# start_atはカレンダーで1二表示される位置
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

title =  "  #{first_day.month}月 #{first_day.year}   \n"
print title

day_of_week= "\n 日 月 火 水 木 金 土 \n"
print day_of_week # 曜日

(1..days_total).each do | cal |
  if
    cal <= start_at
    print "   "
  else
    num = cal - start_at
    num = num.to_s.rjust(3)
    print num
  end
  if cal % 7 == 0
    print "\n"
  end
end
