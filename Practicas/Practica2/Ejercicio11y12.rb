module GenericFactory
  def create(**args)
    new(**args)
  end
end

def self.initialize(**args)
  raise NotImplementedError
end

class Animal
  extend GenericFactory
  def initialize(**args)
    @nombre = args[:nombre]
    @altura = args[:altura]
  end
end

class Persona
  extend GenericFactory
  def initialize(**args)
    p args
    @nombre = args[:nombre]
    @altura = args[:altura]
  end
end

a = Animal.create("nombre":"girafa","altura":2.30)

per = Persona.create("nombre":"Muy Alt@","altura":2.30)
p a.inspect
p per.inspect
