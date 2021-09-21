# frozen_string_literal: true
def from_letter_to_number(letter, map)
  map = map.to_a
  index = map.find_index(letter)
  return index + 10 unless index.nil?

  nil
end

def normalize_number(number)
  index = from_letter_to_number(number, 'A'..'Z')
  index = from_letter_to_number(number, 'a'..'z') if index.nil?
  index = number.to_i if index.nil?
  index
end

def part_converter(number, system, index)
  return 0.0 if number.empty?

  str = number[number.length - 1]
  number = number[0, number.length - 1]
  digit = normalize_number(str).to_i
  res = digit * (system**index).to_f
  index = index >= 0 ? index + 1 : index - 1
  res + part_converter(number, system, index).to_f
end

def number_converter(number, system)
  parts = number.split('.')
  return 0 if parts.size.zero? || parts.size > 2
  return part_converter(parts[0], system, 0) if parts.size == 1

  first = part_converter(parts[0], system, 0)
  second = part_converter(parts[1], system, -1)
  first + second
end
printf 'Enter calculation system:'
sys = gets.chomp.to_s.to_i
printf 'Enter number:'
number = gets.chomp.to_s
puts 'Result: ', number_converter(number, sys)
