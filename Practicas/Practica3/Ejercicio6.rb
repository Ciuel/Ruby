#Analizá y probá los siguientes métodos, que presentan una lógica similar, pero ubican el manejo de excepciones en distintas partes del código.
# ¿Qué resultado se obtiene en cada caso? ¿Por qué?
#
def opcion_1
  a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
  b = 3
  c = a.map do |x|
    x * b
  end
  puts c.inspect
rescue
  0
end

def opcion_2
  c = begin
        a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
        b = 3
        a.map do |x|
          x * b
        end
      rescue
        0
      end
  puts c.inspect
end

def opcion_3
  a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
  b = 3
  c = a.map { |x| x * b } rescue 0
  puts c.inspect
end

def opcion_4
  a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
  b = 3
  c = a.map { |x| x * b rescue 0 }
  puts c.inspect
end

p opcion_1
p '-' * 60
p opcion_2
p '-' * 60
p opcion_3
p '-' * 60
p opcion_4

#	Este script lee una secuencia de no menos de 15 números desde teclado y luego imprime el resultado de

#	de cada número por su entero inmediato anterior.

#	Como primer paso se pide al usuario que indique la cantidad de números que ingresará.