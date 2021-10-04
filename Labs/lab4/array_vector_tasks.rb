def task1(arr)
  size = arr.max + 1
  res = Array.new(size) { 0 }
  arr.each { |item| res[item] += 1 }
  same = []
  arr.each do |item|
    same << item if res[item] > 1
  end
  matrix = []
  same = same.uniq
  same.each do |item|
    matrix << Array.new(res[item]){ item }
  end
  matrix
end

p task1([1, 1, 1, 1, 1, 2, 3, 4, 4, 5,2,6,8,9,6,8,6,3])
