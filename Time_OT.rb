require 'date'
require "time"

class CheckTime
  def initialize(time)
    @time = time
  end

  def Checkin
    begin
      timein = Time.parse(@time).strftime("%k:%M")
    rescue ArgumentError
      p "Time checkin false"
    ensure
      return if timein.nil?
    end
  end

  def Checkout
    begin
      timeout = Time.parse(@time).strftime("%k:%M")
    rescue ArgumentError
      p "Time checkout false"
    ensure
      return if timeout.nil?
    end
  end
end

class Time_OT
  @@checkout_hour
  @@checkout_minute
  @@checkin_hour
  @@checkin_minute
  def self.caculate
    print " Input check in format(h:m) :"
     cin = CheckTime.new(gets.to_s)
    print " Input check out format(h:m) :"
    cout = CheckTime.new(gets.to_s)
    return "Input time valid," if cin.Checkin.nil? ||cout.Checkout.nil?
    checkin = cin.Checkin.split(':')
    checkout = cout.Checkout.split(':')
    @@checkout_hour = checkout[0].to_i
    @@checkout_minute = checkout[1].to_i
    @@checkin_hour   = checkin[0].to_i
    @@checkin_minute = checkin[1].to_i

    if (@@checkout_minute - @@checkin_minute ) < 0
      mi = (@@checkout_minute + (60 - @@checkin_minute))/60.to_f
      h  = @@checkout_hour - @@checkin_hour-1
    elsif @@checkout_minute == @@checkin_minute
      mi = 0
      h  = @@checkout_hour - @@checkin_hour
    else
      mi = (@@checkout_minute - @@checkin_minute)/60.to_f
      h  = @@checkout_hour - @@checkin_hour
    end
    final_time= h+(mi).to_f


    if final_time < 0
      puts "checkout checkin Sai"
    else
      if @@checkin_hour <= 12 && @@checkout_hour >13 && final_time > 4
        puts  "#{final_time - 1} Lunch: Y"
      else  puts  "#{final_time } Lunch: N"
      end
      p (@@checkout_hour >= 21 && final_time > 3) ? "Diner: Y" : "Diner: N "
    end
  end
end
 Time_OT.caculate
