def notacion_hexadecimal(arr)
    arr.map { |value| value.to_s(16).upcase.rjust(2,"0") }.join.to_s
  end

  def notacion_entera(arr)
    arr.each_with_index.map { |value,index| value * 256**index }.sum
  end
  
puts notacion_hexadecimal([0, 128, 255])
#	=> '#0080FF'
puts notacion_entera([0, 128, 255])
#	=> 16744448