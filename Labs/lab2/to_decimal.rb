# frozen_string_literal: true
def integer_part_converter(number, system, index)
  return '' if number.empty?

  str = number[number.length - 1]
  number = number[0, number.length - 1]
  digit = str.to_i
  res = digit * system**index
  res + integer_part_converter(number, system, index + 1).to_i
end

def float_part_converter(number, system)


end

def number_converter(number, system)

  integer_part_converter(number,system, 0)
end
printf 'Enter calculation system:'
sys = gets.chomp.to_s.to_i
printf 'Enter number:'
number = gets.chomp.to_s
puts number_converter(number, sys)