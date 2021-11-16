# frozen_string_literal: true
require_relative 'student'
include ST


students = []
students << Student.new('Marko', true, 0, false, 'Teacher PTU', 'English')
students << Student.new('Lako', false, 7, true, 'Teacher PTU', 'English')
students << Student.new('Wano', true, 1, false, 'PTU', 'German')
students << Student.new('Purlp', false, 0, false, 'School', 'English')
students << Student.new('Tom', false, 0, false, 'Lizei', 'Italic')
students << Student.new('Marie', true, 3, true, 'Teacher PTU', 'Franch')

puts 'Need Dormitory: ', Student.need_dormitory_count, ''
puts 'Teachers with experience:', Student.worked_teacher_student_list, ''
puts 'Finished teacher PTU: ', Student.finished_ptu_student_list, ''
puts 'Language group list: ', Student.language_group_list
