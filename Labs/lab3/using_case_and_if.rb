def part_else(x)
  1.0 / (1.0 + x / (1.0 + x / (1.0 + x)))
end

def part1(x)
  ((x - 2).abs / x**2 * Math.cos(x))**(1.0 / 7.0)
end

def part2(x)
  1.0 / (Math.tan(x + 1.0 / Math.exp(x)) / Math.sin(x)**2)**(7.0 / 2.0)
end

def use_case(x)
  case x
  when -4 then part_else(x)
  when -4..0 then part1(x)
  when 0..12 then part2(x)
  else
    part_else(x)
  end
end

def use_if(x)
  if x > -4 && x <= 0
    part1(x) elsif x.positive? && x <= 12
               part2(x) else part_else(x) end
end
printf 'Enter x: '
x = gets.chomp.to_s.to_i
begin
  y1 = use_case(x)
  y2 = use_if(x)
rescue ZeroDivisionError
  puts 'Divided by 0...'
else
  printf "y1=#{y1}\n"
  printf " y2=#{y2}\n"
end
