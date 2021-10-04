# frozen_string_literal: true
def task1(arr)
  res = Array.new(arr.max + 1) { 0 }
  arr.each { |item| res[item] += 1 }
  same = []
  arr.each { |item| same << item if res[item] > 1 }
  matrix = []
  same.uniq.each { |item| matrix << Array.new(res[item]) { item } }
  matrix
end

p task1([1, 1, 1, 1, 1, 2, 3, 4, 4, 5,2,6,8,9,6,8,6,3])
