def check_number(n, fizz, buzz)
  case
  when n % (fizz * buzz) == 0
    "FizzBuzz"
  when n % buzz == 0
    "Buzz"
  when n % fizz == 0
    "Fizz"
  else
    n
  end
end

fizz = 3
buzz = 5

(1..20).each do |n|
  puts check_number(n, fizz, buzz)
end
