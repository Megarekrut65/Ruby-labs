# frozen_string_literal: true

module ST
  class Student
    attr_accessor :name, :need_dormitory, :experience, :was_teacher, :what_graduated, :language

    def initialize(name, need_dormitory, experience, was_teacher, what_graduated, language)
      @name = name
      @need_dormitory = need_dormitory
      @experience = experience
      @was_teacher = was_teacher
      @what_graduated = what_graduated
      @language = language
    end

    def to_s
      @name
    end
    def self.need_dormitory_count
      res = 0
      ObjectSpace.each_object(Student) { |s| res += 1 if s.need_dormitory }
      res
    end

    def self.worked_teacher_student_list
      res = []
      ObjectSpace.each_object(Student) { |s| res << s if s.was_teacher && s.experience >= 2 }
      res
    end

    def self.finished_ptu_student_list
      res = []
      ObjectSpace.each_object(Student) { |s| res << s if s.what_graduated.downcase == 'teacher ptu' }
      res
    end

    def self.language_group_list
      res = []
      ObjectSpace.each_object(Student) do |s|
        i = nil
        res.each_index do |index|
          if res[index].include? s.language
            i = index
            break
          end
        end
        if !i.nil?
          res[i] += ", #{s}"
        else
          res << "#{res.size + 1}) #{s.language}: #{s}"
        end
      end
      res
    end
  end
end
