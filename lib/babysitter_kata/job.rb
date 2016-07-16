require 'time'

class BabysitterKata::Job
  attr_accessor :start_time,
                :bed_time,
                :leave_time

  AVAILABLE_START_TIME = 16

  def initialize(bed_time, start_time, leave_time )
    @start_time = start_time
    @bed_time = bed_time
    @leave_time = leave_time
  end

  def parse_start_time
     Time.parse(@start_time).hour
  end

  def parse_bed_time
    bed = Time.parse(@bed_time)
    bed.min != 00 ? bed.hour.next : bed.hour
  end

  def bed_before_midnight?
    if parse_bed_time > AVAILABLE_START_TIME
      true
    else
      false
    end
  end

  def parse_leave_time
    leave = Time.parse(@leave_time)
    leave.min != 00 ? leave.hour.next : leave.hour
  end

  def start_to_bed_hours
    if bed_before_midnight?
      parse_bed_time - parse_start_time
    else
      (24 - parse_start_time) + (parse_bed_time)
    end
  end

  def bed_to_midnight_hours
    24 - parse_bed_time
  end

  def midnight_to_leave_hours
    parse_leave_time - 0
  end

  def calculate_payment
    (start_to_bed_hours * 12) + (bed_to_midnight_hours * 8) + (midnight_to_leave_hours * 16)
  end


end
