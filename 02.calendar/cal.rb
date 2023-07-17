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

# 1日の曜日を取得する。
day_position_1 = Array.new(output_first_date.wday, "  ")

# 当月の日数
day_count = Array.new(output_last_date.day) { |i| i + 1 }
day_count = day_count.map! { |num| num.to_s.length == 1 ? " #{num}" : num.to_s }

# 出力するデータが今月か調べ、該当する場合は今日の日付の要素を反転させる。
if output_year == Date.today.year && output_month == Date.today.month
  just = Date.today.day
  day_count.map! do |c|
    if c == day_count[just-1]
      "\e[7m#{c}\e[0m"
    else
     c
    end
  end
end

# 開始日までの空白(スペース)と当月の日数の合計
total_days = day_position_1 + day_count

# カレンダー上部のタイトル
title = "#{output_first_date.month}月#{output_first_date.year}"
print title.to_s.center(22)

# 曜日ラベル
week_labels = "\n 日 月 火 水 木 金 土 "
puts week_labels # 曜日

total_days.each_slice(7) do |slice|
  puts slice.join(' ')
end
