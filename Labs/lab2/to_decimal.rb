# frozen_string_literal: true
def part_converter(number, system, index)
  return '' if number.empty?

  str = number[number.length - 1]
  number = number[0, number.length - 1]
  digit = str.to_i
  res = digit * system**index
  res + part_converter(number, system, index + 1).to_i
end

def number_converter(number, system)
  parts = number.split('.')
  return 0 if parts.size.zero? || parts.size > 2
  return part_converter(number, system, 0) if parts.size == 1

  first = part_converter(number, system, 0).to_s
  second = part_converter(number, system, -1).to_s
  first = '0' if first.empty?
  first += ".#{second}" unless second.empty?
  first
end
printf 'Enter calculation system:'
sys = gets.chomp.to_s.to_i
printf 'Enter number:'
number = gets.chomp.to_s
puts number_converter(number, sys)