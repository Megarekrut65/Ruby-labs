# frozen_string_literal: true

def factorial(n)
  n > 1 ? n * factorial(n - 1) : 1
end

def sum(n, eps, count)
  element1 = count.call(n)
  n += 1
  element2 = element1 + count.call(n)
  while (element1 - element2).abs > eps
    element1 = element2
    n += 1
    element2 = element1 + count.call(n)
  end
  element2
end

def first_sum(eps)
  first_count = proc do |n, *_args|
    (factorial(n - 1).fdiv factorial(n + 1))**(n * (n + 1))
  end
  sum(2, eps, first_count)
end

def second_sum(eps, x)
  second_count = proc do |n, *_args|
    e = 2 * n + 1
    ((x - 1)**e).fdiv (e * (x + 1)**e)
  end
  2 * sum(0, eps, second_count)
end

def third_sum(eps)
  third_count = proc do |n, *_args|
    ((factorial(4 * n - 1) * factorial(2 * n - 1)).fdiv factorial(4 * n) * 2**(2 * n) * factorial(2 * n))
  end
  sum(1, eps, third_count)
end
EPS = 0.00001
printf "First sum=#{first_sum(EPS)}\n"
printf 'Enter x: '
x = gets.chomp.to_s.to_i
printf "Second sum=#{second_sum(EPS, x)}\n ln(10)=#{Math.log(x)}\n"
printf "Third sum=#{third_sum(EPS)}\n"
