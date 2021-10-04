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

def task5(arr)
  res = arr.reject(&:nonzero?)
  arr -= res
  res += arr.reject(&:positive?)
  arr -= res
  res + arr
end

def task6(arr)
  sum1 = arr.inject(0) do |sum, item|
    if item.even? && item.negative?
      sum + item
    else sum
    end
  end
  sum2 = arr.inject(0) do |sum, item|
    if item.odd? && item.positive?
      sum + item
    else sum
    end
  end
  [sum1, sum2]
end

def task7(arr1, arr2)
  task3(arr1, arr2)
end

p task6([1,0,-5,2,0,3,-4,4])