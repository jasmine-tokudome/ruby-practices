cd fizz = 3
buzz = 5

output_array = (1..20).to_a.map do |n|
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

puts output_array
