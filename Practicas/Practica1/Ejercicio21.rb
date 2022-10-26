def multiplos_de_3_y_5(top)
    (1...top).select { |n| n % 3 == 0 && n % 5 == 0 }.sum
  end
  
puts multiplos_de_3 y_5(100)