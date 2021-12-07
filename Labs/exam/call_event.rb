require_relative 'reminder_event'
class CallEvent < ReminderEvent
  attr_accessor :number_to_call

  def initialize(name, importance, date_start, date_end, reminder, number_to_call)
    super(name, importance, date_start, date_end, reminder)
    @number_to_call = number_to_call
  end

  def to_s
    super + ", call to: #{@number_to_call}"
  end
end