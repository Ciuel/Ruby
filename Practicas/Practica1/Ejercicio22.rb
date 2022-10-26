def multi_check(values, num)
    values.all? { |val| num.modulo(val) == 0 }
  end
  
  def multiplos_de(values, top)
    (1..top).select { |num| multi_check(values, num) }.sum
  end
  
puts multiplos_de([3, 5, 17, 28, 65], 100_000)