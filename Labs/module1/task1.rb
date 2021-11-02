# frozen_string_literal: true
def check(a, b, c)
  az = a.to_i
  bz = b.to_i
  cz = c.to_i
  (az | bz | cz).zero?
end

def function_f(x, a, b, c)
  if c.negative? && x != 0
    -a * x - c
  elsif c.positive? && x.zero?
    (x - a).fdiv(-c)
  else
    (b * x).fdiv(c - a)
  end
end

def tabulation(a, b, c, x_start, x_end, dx)
  integer_type = check(a, b, c)
  x = x_start
  printf "x\ty\n"
  while x_end >= x
    res = function_f(x, a, b, c)
    if res.nan?
      printf "Function is undefined for current a=#{a}, b=#{b}, c=#{c}, x=#{x}\n"
    else
      res = res.to_i if integer_type
      printf "#{x}\t#{res}\n"
    end
    x += dx
  end
end
# Variant 4
a = 34.6
b = 1.9
c = 13.2
x_start = -5
x_end = 10
dx = 0.5

tabulation(a, b, c, x_start, x_end, dx)

