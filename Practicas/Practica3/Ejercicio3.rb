#¿Para qué sirven begin .. rescue .. else y ensure? Pensá al menos 2 casos concretos en que usarías estas sentencias en un script Ruby.

# begin: se usa para encerrar un bloque de código que puede generar una excepción
# rescue: se usa para manejar una excepción
# else: se usa para encerrar un bloque de código que se ejecuta si no se generó ninguna excepción
# ensure: se usa para encerrar un bloque de código que se ejecuta siempre, independientemente de si se generó una excepción o no

# Ejemplo 1: se usa begin .. rescue .. else para manejar una excepción y ejecutar un bloque de código en caso de que no se genere ninguna excepción

begin
  puts 'Entrando a begin'
  a = 5 / 1
  puts 'Terminando begin'
rescue ZeroDivisionError
  puts 'Tratando excepción'
else
  puts 'Ejecutando else'
end

# Ejemplo 2: se usa begin .. rescue .. ensure para manejar una excepción y ejecutar un bloque de código que se ejecuta siempre, independientemente de si se generó una excepción o no

begin
  puts 'Entrando a begin'
  a = 5 / 0
  puts 'Terminando begin'
rescue ZeroDivisionError
  puts 'Tratando excepción'
ensure
  puts 'Ejecutando ensure'
end
