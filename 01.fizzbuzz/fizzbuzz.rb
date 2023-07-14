# 2つの数字3と5を変数xとyにそれぞれ代入する
x = 3
y = 5

# 1〜20までの数字を順にnumberに代入し指定した結果を出力させる
(1..20).each do |number|
  result_calc = 'Fizz' if number % x == 0 # 3で割り切れる場合はFizz
  result_calc = 'Buzz' if number % y == 0 # 5で割り切れる場合はBuzz
  result_calc = 'FizzBuzz' if number % (x * y) == 0 # 15で割り切れる場合はFizzBuzz
  result_calc = number if result_calc.nil? # 上記いづれにも該当しなかった場合はnu
  puts "#{result_calc}"
end
