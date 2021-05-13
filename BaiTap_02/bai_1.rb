class Array
  attr_accessor :a, :b
  def initialize arr_a , arr_b
    @a = arr_a
    @b = arr_b
  end

  def intersection_arr
    result_intersection = []
    a.each {|imple_a| result_intersection << imple_a if b.include? imple_a  }
    result_intersection
  end

  def difference_arr
    result_difference = []
    a.each {|imple_a| result_difference << imple_a unless b.include? imple_a  }
    result_difference
  end
end

  a = [2,20,1,"/a","/c"]
  b = [1,"/c/a/","/b","/a",50]
  c = 1

  p b.include? c
  re = Array.new a , b
  p re.intersection_arr
  p re.difference_arr
