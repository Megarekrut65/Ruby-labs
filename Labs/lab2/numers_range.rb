printf 'Enter number base:'
base = gets.chomp.to_s.to_i
printf 'Enter number of digits of the number:'
digits = gets.chomp.to_s.to_i
printf 'Enter number of digits of the number(integer part):'
int_part = gets.chomp.to_s.to_i
res = (1 - base**(1 - digits)) * base**int_part
puts 'Diap=', res.round
