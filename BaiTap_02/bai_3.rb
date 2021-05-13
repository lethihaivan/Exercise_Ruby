require 'date'
require "time"

class Caculate
    def initialize(time)
    @time = time
  end
  def Checkin
    begin
      timein = Time.parse(@time).strftime("%d/%m/%Y")
    rescue ArgumentError
      p "Time format fail false"
    end
  end

  def self.caculator time_in , time_now
     yaer_number = time_now.year - time_in.year
     month_number = 12 - time_in.month
     day_number = time_now.day - time_in.day
     nghi_day = time_in.day < 10 ?  (month_number + 1) : (month_number+0.5)
     case yaer_number
      when 0
        "Số ngày nghỉ phép: #{nghi_day}"
      when 1..3
        "Số ngày nghỉ phép: 12"
      when 4
        "Số ngày nghỉ phép: 13"
      else
        "Số ngày nghỉ phép: 14"
      end
  end

  def self.tinh
    print " Input check in format(dd/mm/yyyy) :"
    date = Caculate.new(gets).Checkin
    return if date == "Time format fail false"
    time_in = Date.strptime(date,'%d/%m/%Y')
    time_now = Date.strptime(Time.now.strftime("%d/%m/%Y"),'%d/%m/%Y')
    if (time_now > time_in)
      p Caculate.caculator time_in ,time_now
    else
      p "Time input grater than time now"
    end
  end
end


Caculate.tinh
