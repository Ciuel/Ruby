
def contar(string, inner_string)
    string.downcase.scan(inner_string.downcase).length
  end
  
puts contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")
  