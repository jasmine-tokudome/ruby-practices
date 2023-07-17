#!/usr/bin/env ruby

require 'date'
require 'optparse'

params = ARGV.getopts('y:m:')

input_year = params['y'].to_i # 入力した年
input_month = params['m'].to_i # 入力した月

output_year = input_year.zero? ? Date.today.year : input_year
output_month = input_month.zero? ? Date.today.month : input_month
output_first_day = Date.new(output_year, output_month, 1)
output_last_day = Date.new(output_year, output_month, -1)

# 1日の曜日(1日の前に必要なスペースの数)を取得し配列を作成
day_position_1 = Array.new(output_first_day.wday, "  ")

# 当月の日数
dairy_date = Array.new(output_last_day.day) { |i| i + 1 }
dairy_date = dairy_date.map! { |num| num.to_s.length == 1 ? " #{num}" : num }

# 出力するデータが今月か調べ、該当する場合は今日の日付の要素を反転させる。
if output_year == Date.today.year && output_month == Date.today.month
  date_for_custom = Date.today.day
  dairy_date.map! do |day_value|
    if day_value == dairy_date[date_for_custom-1]
      "\e[7m#{day_value}\e[0m"
    else
      day_value
    end
  end
end

# 開始日までの空白(スペース)と当月の日数の合計
date_for_calender = day_position_1 + dairy_date

# カレンダー上部のタイトル
title = "#{output_first_day.month}月#{output_first_day.year}"

# 曜日ラベル
week_labels = "日 月 火 水 木 金 土"

puts title.to_s.center(20),week_labels

date_for_calender.each_slice(7) do |week|
  puts week.join(' ')
end
