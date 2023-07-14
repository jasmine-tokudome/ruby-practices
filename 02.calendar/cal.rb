#!/usr/bin/env ruby

require 'date'
require 'optparse'

params = ARGV.getopts('y:m:')

input_year = params['y'].to_i # 入力した年
input_month = params['m'].to_i # 入力した月

today_date = Date.today

output_year = input_year.zero? ? Date.today.year : input_year
output_month = input_month.zero? ? Date.today.month : input_month
output_first_date = Date.new(output_year, output_month, 1)
output_last_date = Date.new(output_year, output_month, -1)

# 1日の曜日を取得する。start_atはカレンダーで「1」が表示される位置になる
start_at = output_first_date.wday

# 当月の日数
day_count = output_last_date.day

# 開始日までの空白(スペース)と当月の日数の合計
total_days = day_count + start_at

# カレンダー上部のタイトル
title = "#{output_first_date.month}月#{output_first_date.year}"
print title.to_s.center(22)

# 曜日ラベル
week_labels = "\n 日 月 火 水 木 金 土 "
puts week_labels # 曜日

# 反転させる必要があるか調べるための準備
just_today = Date.today.day
retuen_date = Date.new(output_first_date.year, output_first_date.month, just_today)

(1..total_days).each do |cal|
  if cal <= start_at
    print '   '
  else
    num = cal - start_at # 当月の日付
    if num == just_today && today_date == retuen_date
      num = num.to_s.rjust(3)
      print "\e[7m#{num}\e[0m"
    else
      num = num.to_s.rjust(3)
      print num
    end
  end
  print "\n" if cal % 7 == 0
end

print "\n"
