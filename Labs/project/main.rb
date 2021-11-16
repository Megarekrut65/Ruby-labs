# frozen_string_literal: true
require_relative 'student'
include ST


students = []
students << Student.new('Marko', true, 0, false, 'School', 'English')
students << Student.new('Lako', false, 7, true , 'PTU', 'English')
students << Student.new('Wano', true, 1, false, 'PTU', 'German')
students << Student.new('Purlp', false, 0, false, 'School', 'English')
students << Student.new('Tom', false, 0, false, 'Lizei', 'Italic')
students << Student.new('Marie', true, 3, false, 'School', 'Franch')

puts "Need Domitory: ", Student.need_dormitory_count