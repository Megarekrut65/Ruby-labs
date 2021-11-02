class Abiturient
  @@current_id = 0
  attr_accessor :name, :address, :phone, :marks
  attr_reader :id, :current_id

  def initialize(name, address, phone, marks)
    @id = Abiturient.create_id
    @name = name
    @address = address
    @phone = phone
    @marks = marks
  end

  def to_s
    "#{id}. #{name}, address: #{address}, phone: #{phone}, marks: #{marks}"
  end

  def has_bad_marks
    marks.each do |mark|
      return true if mark < 60
    end
    false
  end

  def sum_marks
    marks.inject(0) do |mark, sum|
      mark + sum
    end
  end
  def self.create_id
    @@current_id += 1
  end
end

def print_with_bad_marks(abiturients)
  puts 'There are abiturients with bad marks:'
  abiturients.each do |person|
    puts person if person.has_bad_marks
  end
end

def check_marks(marks, min)
  marks.each do |mark|
    return false if mark < min
  end
  true
end

def print_with_higher_marks(abiturients, min_mark)
  puts "There are abiturients with marks higher than #{min_mark}:"
  abiturients.each do |person|
    puts person if check_marks(person.marks, min_mark)
  end
end

def print_with_the_highest_marks(abiturients, number)
  puts 'There are abiturients with the highest marks:'
  res = abiturients.sort_by(&:sum_marks).reverse
  res.each_index do |i|
    break if i >= number

    puts res[i]
  end
  puts ''
  puts 'Also, there are abiturients with semi-passable amount:'
  semi_passable_amount = 60
  res.each do |person|
    amount = person.sum_marks.div(person.marks.length)
    puts person if amount.to_i >= semi_passable_amount
  end
end
abiturients = []
abiturients << Abiturient.new('Ostin de Marks', 'Kiev', '+3807263264', [100, 87, 89, 95])
abiturients << Abiturient.new('Paul Phionel', 'Lviv', '+38052131264', [60, 60, 60, 60])
abiturients << Abiturient.new('Karl II', 'Odesa', '+38072645344', [100, 55, 89, 65])
abiturients << Abiturient.new('Marie Grand', 'Ternopil', '+380353244', [1, 2, 3, 4])
abiturients << Abiturient.new('Deniel Smith', 'London', '+3807322364', [81, 94, 99, 91])
abiturients << Abiturient.new('Kentuki Oto', 'Kioto', '+382142144', [70, 80, 90, 100])
abiturients << Abiturient.new('Karl III', 'Odesa', '+380726342344', [100, 100, 100, 60])
abiturients << Abiturient.new('Taras Tarasenko', 'Kiev', '+3803366344', [25, 78, 100, 71])
print_with_bad_marks(abiturients)
puts ''
print_with_higher_marks(abiturients, 80)
puts ''
print_with_the_highest_marks(abiturients, 4)
