# frozen_string_literal: true
printf 'Enter coefficient a: '
a = gets.chomp.to_s.to_f
printf 'Enter coefficient b: '
b = gets.chomp.to_s.to_f
printf 'Enter coefficient c: '
c = gets.chomp.to_s.to_f
printf 'Enter x: '
x = gets.chomp.to_s.to_f
printf 'Enter angle phi: '
phi = gets.chomp.to_s.to_f
part1 = (Math.sin(3 * x)**3 + Math.atan(phi) - 6 * 10**3.1)
part2 = Math.sqrt(a * x**2 + b * x + c)
res = part1 / part2 + Math.exp(x) * Math.tan(x + 2).abs
puts 'Result:', res
