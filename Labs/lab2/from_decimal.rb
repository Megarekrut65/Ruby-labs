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

def integer_part_converter(number, system)
  return '' if number.zero?

  digit = number % system
  integer_part_converter(number / system, system).to_s + normalize_number(digit).to_s
end

def float_part_converter(number, system)
  return '' if number.zero?

  digit = system * number
  integer = digit.to_i
  float = digit.modulo(1)
  normalize_number(integer).to_s + float_part_converter(float, system).to_s
end

def number_converter(number, system)
  integer = number.to_i
  float = number.modulo(1)
  first = integer_part_converter(integer, system)
  second = float_part_converter(float, system).to_s
  first = '0' if first.empty?
  first += ".#{second}" unless second.empty?
  first
end
printf 'Enter calculation system:'
sys = gets.chomp.to_s.to_i
printf 'Enter number:'
number = gets.chomp.to_s.to_f
puts number_converter(number, sys)
