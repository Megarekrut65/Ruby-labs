require_relative 'event'
class ReminderEvent < Event
  attr_accessor :reminder

  def initialize(name, importance, date_start, date_end, reminder)
    super(name, importance, date_start, date_end)
    @reminder = reminder
  end

  def to_s
    "#{super}, reminder: #{reminder}"
  end
end