class Bai2
  def self.luythua arr
    luy_thua = Proc.new { |n| (n == 6 || n == 7) ? n : n*n }
    p "Luy thua array :  #{arr.map(&luy_thua)}"
  end

  def self.caculate_sum arr
   p "Sum array :  #{arr.inject(:+)}"
  end

  def input_arr
    n = 5
    array = Array.new
    msg = "Enter the elements"
    puts msg
    while (n  > 0)
       array.push(gets.chomp.to_i)
      n  = n  - 1
    end
    puts "Elements of the array are:"
    p array
  end
end

  arr_out = Bai2.new.input_arr
  Bai2.caculate_sum arr_out
  Bai2.luythua arr_out
