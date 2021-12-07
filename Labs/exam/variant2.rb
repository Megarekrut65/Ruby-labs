require_relative 'importance'
require_relative 'event'
require_relative 'reminder_event'
require_relative 'call_event'

class EventManager
  attr_reader :events

  def initialize
    @events = []
  end

  def add(event)
    @events << event
  end

  def to_s
    res = ""
    @events.each { |event|  res += "#{event}\n" }
    res + "\n"
  end
  def find_by_date(date)
    @events.map { |event| event if event.date_start <= date && event.date_end >= date }
  end

  def find_by_dates(date_start, date_end)
    raise "Date start can't be bigger than date end" if date_start > date_end

    @events.map { |event| event if event.date_start >= date_start && event.date_end <= date_end}
  end

  def sort_by_date
    @events.sort{ |a,b| a.date_start <=> b.date_start}
  end

  def sort_by_importance
    @events.sort{ |a,b| a.importance <=> b.importance}
  end

  def upcoming_event(date)
    return nil if @events.size == 0

    res = @events[0]
    @events.each do |event|
      res = event if (event.date_start - date).abs < (res.date_start - date).abs
    end
    res
  end
end

manager = EventManager.new
manager.add Event.new("birth", 2, 11, 12)
manager.add ReminderEvent.new("birth", 0, 5, 5, "Buy gift")
manager.add CallEvent.new("birth", 1, 1, 6, "Buy gift", "38093481")
puts "Events:", manager
puts "Find by date:", manager.find_by_date(5)
puts "Find by dates:", manager.find_by_dates(5, 14)
puts "Sort by date:", manager.sort_by_date
puts "Sort by importance:", manager.sort_by_importance
puts "Upcoming:", manager.upcoming_event(4)



