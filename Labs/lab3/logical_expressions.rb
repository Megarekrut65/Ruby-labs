# frozen_string_literal: true

$A = true
$B = false
$C = true
$X = 2
$Y = 10
$Z = -50
$Aa = 2.5
$P = true
def part_a
  !($A || $B) && ($A && !$B)
end

def part_b
  ($Z != $Y).object_id <= ($Y <= 6).object_id && $A || $B && $C && ($X >= 1.5)
end

def part_c
  (8 - $X * 2 <= $Z) && ($X**2 <= $Y**2) || ($Z >= 15)
end

def part_d
  $X > 0 && $Y < 0 || $Z >= ($X * $Y - $Y / $X) + -$Z
end

def part_e
  !($A || $B && !($C || (!$A || $B)))
end

def part_f
  $X**2 + $Y**2 >= 1 && $X >= 0 && $Y >= 0
end

def part_g
  ($A && (($C && $B) != ($B || $A)) || $C) && $B
end

def part2
  ((Math.log($Aa) > $Aa) || !$P) && (Math.sqrt($Aa) < $Aa**4)
end

printf "a)#{part_a}\n"
printf "b)#{part_b}\n"
printf "c)#{part_c}\n"
printf "d)#{part_d}\n"
printf "e)#{part_e}\n"
printf "f)#{part_f}\n"
printf "g)#{part_g}\n"
printf "2)#{part2}\n"
