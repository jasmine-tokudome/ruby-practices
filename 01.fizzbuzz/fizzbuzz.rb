# 2つの数字3と5を変数FIZZ_NUMBERとBUZZ_NUMBERにそれぞれ代入する
FIZZ_NUMBER = 3
BUZZ_NUMBER = 5
FIZZ_BUZZ_NUMBER = FIZZ_NUMBER * BUZZ_NUMBER

# 1〜20までの数字を順にnに代入し指定した結果を出力させる
output_array = []
(1..20).each do |n|
  output_array << if (n % FIZZ_BUZZ_NUMBER).zero?
    'FizzBuzz'
  elsif (n % FIZZ_NUMBER).zero?
    'Fizz' 
  elsif (n % BUZZ_NUMBER).zero?
    'Buzz'
  else
    n
  end
end
puts output_array

output_array = (1..20).map do |n|
  if (n % FIZZ_BUZZ_NUMBER).zero?
    'FizzBuzz'
  elsif (n % FIZZ_NUMBER).zero?
    'Fizz' 
  elsif (n % BUZZ_NUMBER).zero?
    'Buzz'
  else
    n
  end
end
p output_array
