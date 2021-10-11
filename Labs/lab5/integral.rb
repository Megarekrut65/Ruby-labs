# frozen_string_literal: true
def prm(a, b, n)
  h = (b - a).fdiv n
  res = (1..n).inject(0) do |sum, i|
    xi = (a + i * h - (h.fdiv 2)).to_f
    sum + yield(xi)
  end
  res * h
end

def trp(a, b, n, f)
  h = (b - a).fdiv n
  res = f.call(a).fdiv 2 + (f.call(b).fdiv 2)
  res += (1..n / 2).inject(0) do |sum, i|
    sum + f.call(a + i * h) + f.call(b - i * h)
  end
  res * h
end
puts 'f1=', prm(0.3, 1.0, 5000) { |x| Math.sqrt(2**x - 1) }
puts 'f1=', trp(0.3, 1.0, 5000, proc { |x| Math.sqrt(2**x - 1) })
puts
puts 'f2=',prm(0.2, 0.3, 5000) { |x| (Math.asin(Math.sqrt(x))).fdiv (Math.sqrt(x * (1 - x))) }
puts 'f2=',trp(0.2, 0.3, 5000, proc { |x| (Math.asin(Math.sqrt(x))).fdiv (Math.sqrt(x * (1 - x))) })
