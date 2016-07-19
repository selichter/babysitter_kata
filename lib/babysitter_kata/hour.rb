require 'time'

module Hour

  def parse_time(str)
    Time.parse(str)
  end

  def get_hour(str)
    parsed_time = parse_time(str)
    parsed_time.min != 00 ? parsed_time.hour.next : parsed_time.hour
  end

  # def before_midnight?(time)
  #   get_hour(time) >= AVAILABLE_START_TIME && get_hour(time) <= MIDNIGHT ? true : false
  # end

end