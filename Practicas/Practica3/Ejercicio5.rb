#¿Para qué sirve redo? ¿Qué diferencias principales tiene con retry?

# retry: se usa para volver a ejecutar un bloque de código que generó una excepción desde el inicio
# redo: se usa para volver a ejecutar un bloque de código que generó una excepción desde la última iteración del bloque

#redo
(0..5).each do |i|
  puts "Value: #{i}"
  redo if i > 2
end

# Output:
#Value: 0
#Value: 1
#Value: 2
#Value: 3
#Value: 3
#Value: 3
#Value: 3
#Value: 3

#retry
(0..5).each do |i|
  puts "Value: #{i}"
  retry if i > 2
end


# Output:
# Value: 0
# Value: 1
# Value: 2
# Value: 3
# Value: 0
# Value: 1
# Value: 2