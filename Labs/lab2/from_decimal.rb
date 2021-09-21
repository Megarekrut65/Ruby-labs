def normalize_number(number)
  return number if number.abs < 10

  sign = 1
  sign = -1 if number.negative?
  number = number.abs
  number -= 10
  arr = 'A'..'Z'
  arr = arr.to_a
  str = arr[number]
  str = "-#{str}" if sign == -1
  str
end

def print_number(number, system)
  return '' if number.zero?

  digit = number % system
  print_number(number / system, system).to_s + normalize_number(digit).to_s
end
printf 'Enter calculation system:'
sys = gets.chomp.to_s.to_i
printf 'Enter number:'
number = gets.chomp.to_s.to_i
puts print_number(number, sys)
