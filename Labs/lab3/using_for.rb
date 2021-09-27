# frozen_string_literal: true
#
def part5_recursive(n)
  if n.positive?
    Math.sqrt(2 + part5_recursive(n - 1))
  else
    0
  end
end

def part5(n)
  res = 0
  (1..n).each do |_i|
    res = Math.sqrt(res + 2)
  end
  res
end

def part1(x)
  res = 1
  (1..10).each do |i|
    part = ((i + 1.0) / (i + 2.0)) * x**i
    part *= -1 if i.odd?
    res += part
  end
  res
end
printf "Sum1=#{part1(2)}\n"
printf 'Enter n: '
n = gets.chomp.to_s.to_i
printf "Sum5=#{part5(n.abs)}\n"
printf " SumRecursive5=#{part5_recursive(n.abs)}"
