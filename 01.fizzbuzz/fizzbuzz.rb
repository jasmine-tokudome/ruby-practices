# frozen_string_literal: true

fizz = 3
buzz = 5

(1..20).each do |fizz_buzz|
  if (fizz_buzz % (fizz * buzz)).zero?
    puts 'FizzBuzz'
  elsif (fizz_buzz % buzz).zero?
    puts 'Buzz'
  elsif (fizz_buzz % fizz).zero?
    puts 'Fizz'
  else
    puts fizz_buzz
  end
end
