#Partiendo del script que modificaste en el inciso anterior, implementá una nueva clase de excepción que se utilice para indicar que la entrada del usuario no es un valor numérico entero válido. ¿De qué clase de la jerarquía de Exception heredaría?


class NotIntegerArgumentError < ArgumentError
  def initialize(msg = "This argument should be a number")
    super(msg)
  end
end