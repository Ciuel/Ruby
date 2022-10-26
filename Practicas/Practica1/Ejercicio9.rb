def stringreverso(string)
    string.reverse
  end
  
  def string_sin_espacio(string)
    string.split.join
  end
  
  def string_a_arreglo_ascii(string)
    arr = Array.new
    string.each_byte { |c| arr.append(c) }
    arr
  end
  
  def string_reemplaza_vocal(string)
    string.downcase.tr('a', '4').tr('e', '3').tr('i', 'l').tr('o', '0').tr('u', '6')
  end
  
puts string_reverso("Hello!")
puts string_sin espacio("Hello, how are you?")
puts string_a_arreglo_ascii("Hello?")
puts string_reemplaza_vocal("murcielago")
  