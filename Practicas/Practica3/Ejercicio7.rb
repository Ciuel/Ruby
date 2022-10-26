#Suponé que tenés el siguiente script y se te pide que lo hagas resiliente (tolerante a fallos),
# intentando siempre que se pueda recuperar la situación y volver a intentar la operación que falló.
# Realizá las modificaciones que consideres necesarias para lograr que este script sea más robusto.

  # Este script lee una secuencia de no menos de 15 números desde teclado y luego imprime el resultado de la división
  # de cada número por su entero inmediato anterior.

  # Como primer paso se pide al usuario que indique la cantidad de números que ingresará.

def numcheck()
  begin
    Integer(gets)
  rescue ArgumentError
    puts 'Ese no es un número'
    retry
  end
end

cantidad = 0
while cantidad < 15
  puts 'Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
  cantidad = numcheck()
end

# Luego se almacenan los números
numeros = 1.upto(cantidad).map do
  puts 'Ingrese un número'
  numcheck()
end

# Y finalmente se imprime cada número dividido por su número entero inmediato anterior

resultado = numeros.map { |x| x / (x - 1) rescue 0}

puts 'El resultado es: %s' % resultado.join(', ')