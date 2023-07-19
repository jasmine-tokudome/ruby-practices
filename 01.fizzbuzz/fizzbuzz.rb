fizz = 3
buzz = 5

(1..20).each do |fizz_buzz|
  if fizz_buzz % (fizz * buzz) == 0
    puts 'FizzBuzz'
  elsif fizz_buzz % buzz == 0
    puts 'Buzz'
  elsif fizz_buzz % fizz == 0
    puts 'Fizz'
  else
    puts "#{fizz_buzz}"
  end
end
