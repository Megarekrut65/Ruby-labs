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

def task2(arr)
  sum_value = 0
  sum_index = 0
  arr.each_index do |i|
    if arr[i].to_i.even?
      sum_value += arr[i].to_i
      sum_index += i
    end
  end
  [sum_value, sum_index]
end

def task3(arr1, arr2)
  arr1 & arr2
end

def task4(arr)
  arr.unshift(arr.pop)
end
p task4([1,2,3,4])