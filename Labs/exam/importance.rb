module IMPORTANCE
  LOW = 0
  MEDIUM = 1
  HIGH = 2

  def self.convert(importance)
    case importance
    when LOW
      'LOW'
    when MEDIUM
      'MEDIUM'
    when HIGH
      'HIGH'
    else raise 'Incorrect enum value!'
    end

  end
end
