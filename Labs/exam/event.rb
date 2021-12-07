require_relative 'importance'

class Event
  attr_accessor :name, :importance, :date_start, :date_end

  def initialize(name, importance, date_start, date_end)
    raise "Date start can't be bigger than date end" if date_start > date_end
    raise "Importance must be from module IMPORTANCE!" if importance < IMPORTANCE::LOW || importance > IMPORTANCE::HIGH

    @name = name, @importance = importance, @date_start = date_start, @date_end = date_end
  end

  def to_s
    res = "Event -> name: #{@name}, importance: #{IMPORTANCE.convert(@importance)}, date: "
    res += if date_start == date_end
             date_start.to_s
           else "#{date_start}-#{date_end}"
           end
    res
  end

end
