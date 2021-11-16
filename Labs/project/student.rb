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

    def self.need_dormitory_count
      res = 0
      ObjectSpace.each_object(Student) { |s| res += 1 if s.need_dormitory }
      res
    end
  end
end
