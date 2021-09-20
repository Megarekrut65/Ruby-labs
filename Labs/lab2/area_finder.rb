# frozen_string_literal: true

Point = Struct.new(:x, :y)
def get_point(index)
  printf "Enter x#{index}:"
  x = gets.chomp.to_s.to_i
  printf "Enter y#{index}:"
  y = gets.chomp.to_s.to_i
  Point.new(x, y)
end

def count_sum(point1, point2)
  (point1.x + point2.x) * (point1.y - point2.y)
end
printf 'Enter the number of vertices of the figure:'
ver_number = gets.chomp.to_s.to_i
if ver_number > 2
  point0 = get_point(0)
  current = point0
  sum = 0
  (1...ver_number).each do |i|
    point_i = get_point(i)
    sum += count_sum(current, point_i)
    current = point_i
  end
  sum += count_sum(current, point0)
  sum = sum.abs
  sum /= 2
  puts 'Area is ', sum
end
