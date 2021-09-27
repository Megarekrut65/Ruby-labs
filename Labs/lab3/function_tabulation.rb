# frozen_string_literal: true

def tabulation(step, n, func)
  printf "x\ty\n"
  1.step(n, step) { |i| printf "#{i}\t#{func.call(i)}\n" }
  puts ''
end
C = 10
N = 10
func_y = proc do |x, *_args|
  y = (x**(1.fdiv 4) - x**(-1.fdiv 4))**-N
  y += (x + 1).fdiv(x**2 - 4 * x + 3 * N)
  y += ((36 * x * C * N)**(1.fdiv 4)).fdiv((x + C * N + 1).fdiv(x + 5))
  y
end
func_z = proc do |x, *_args|
  z = Math.tan(2 * x) * Math.cos(2 * x)**-1 - Math.tan(2 * C + x) * Math.cos(2 * x)**-2
  z /= Math.cos(2 * x)**-1 + Math.cos(3 * x)**-2
  z += (1 + Math.cos(N * x)**(1.fdiv C)).fdiv(2 * x + Math.sin(3 * x)**2)
  z
end
step = N.fdiv(N + C)
tabulation(step, N, func_y)
tabulation(step, N, func_z)

