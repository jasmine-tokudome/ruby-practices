# 問題文の「プリントするプログラム」の記載にしたがい
# printメソッドで書きました。

a = 3
b = 5

(1..20).each do | fizzbuzz |
  if fizzbuzz % ( a * b ) == 0
    print "FizzBuzz\n"
  elsif fizzbuzz % a == 0
    print "Fizz\n"
  elsif fizzbuzz % b == 0
    print "Buzz\n"
  else
    print "#{fizzbuzz}\n"  
 end
end

# 以下はputsメソッドバージョン。

# a = 3
# b = 5

# (1..20).each do | fizzbuzz |
#   if fizzbuzz % ( a * b ) == 0
#     puts "FizzBuzz"
#   elsif fizzbuzz % a == 0
#     puts "Fizz"
#   elsif fizzbuzz % b == 0
#     puts "Buzz"
#   else
#     puts "#{fizzbuzz}\n"  
#  end
# end
