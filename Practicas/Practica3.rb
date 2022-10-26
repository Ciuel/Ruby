def opcion_l
  a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
  b = 3
  c = a.map do |x|
    x * b
  end
  puts c.inspect rescue 0
end

def opcion_2
  c = begin
     a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
     b = 3
     a.map do |x|
       x * b
     end rescue 0
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

#p opcion_l #p "-"*60 #p opcion_2 #p "-"*60 #p opcion_3 #p "-"*60 #p opcion_4

#	Este script lee una secuencia de no menos de 15 números desde teclado y luego imprime el resultado de

#	de cada número por su entero inmediato anterior.

#	Como primer paso se pide al usuario que indique la cantidad de números que ingresará.

class NotIntegerArgumentError < ArgumentError
  def initialize(msg = "This argument should be a number")
    super(msg)
  end
end

#cantidad = 0 #LIMIT = 3
#while cantidad < LIMIT
#	puts "Cuál es la cantidad de números que ingresará? Debe ser al menos #{LIMIT}"
#	begin
#	cantidad = Integer(gets)
#	rescue ArgumentError
#	raise NotIntegerArgumentError
#	end
#	p "Ese numero es menor a #{LIMIT}" if cantidad<LIMIT #end
## Luego se almacenan los números #numeros = l.upto(cantidad).map do
#	puts 'Ingrese un número'
#	numero = Integer(gets)
#end
## Y finalmente se imprime cada número dividido por su número entero inmediato anterior #resultado = numeros.map do |x|
#puts 'El resultado es: %s' % resultado.join(', ')
#def fun3
#	puts "Entrando a fun3"
#	raise RuntimeError, "Excepción intencional"
#	puts "Terminando fun3"
#rescue NoMethodError => e
#	puts "Tratando excepción por falta de método"
#rescue RuntimeError => e
#	puts "Tratando excepción provocada en tiempo de ejecución" #rescue
#	puts "Tratando una excepción cualquiera"
#ensure
#	puts "Ejecutando ensure de fun3"
#end
#
#def fun2(x)
#	puts "Entrando a fun2"
#	fun3
#	a = 5 / x
#	puts "Terminando fun2"
#end
#def fun1(x)
#	puts "Entrando a fun1"
#	fun2 x #rescue
#	puts "Manejador de excepciones de fun1"
#	raise #ensure
#	puts "Ejecutando ensure de fun1"
#end
#
#begin
#	x = 0
#	begin
#	fun1	x
#	rescue	Exception	=>	e
#	puts	"Manejador	de	excepciones de Main"
#	if x	== 0
#	puts "Corrección	de x"
#	x = 1
#	retry
#	end
#	end
#	puts "Salida"
#end
##Se manejaría RuntimeError con el manejador genérico y no el suyo ##Si, generaría un loop infinito ya que se sobreescribe a 0 cada vez
def procesar_archivo(route, &block)
  success_counter = 0
  begin
    lines = open(route).each_line rescue Errno::ENOENT puts "Esa ruta no es válida" return success_counter
  end

  lines.each do |line|
    begin
      puts block.call(line) success_counter += l rescue => e
      puts "Error encontrado: #{e}"
    end
  end
  success_counter
end
puts procesar_archivo('/tmp/datos.txt') { |linea| Integer(linea) }