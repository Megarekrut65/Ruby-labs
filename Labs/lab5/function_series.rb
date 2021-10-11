def series_n(x, n)
  (0..n).inject(0) do |sum, i|
    sum + yield(x, i)
  end
end

def series_eps(x, eps)
  i = 0
  sum0 = yield(x, i)
  i += 1
  loop do
    sum = yield(x, i) + sum0
    i += 1
    break if (sum0 - sum).abs <= eps

    sum0 = sum
  end
  sum0
end

class Integer
  def factorial
    f = 1
    (1..self).each do |i|
      f *= i
    end
    f
  end
end
puts series_n(0.5, 50) { |x, i| ((Math.log(3)**i) * x**i).fdiv (i.factorial) }
puts series_eps(0.5, 1e-5) { |x, i| ((Math.log(3)**i) * x**i).fdiv (i.factorial) }
