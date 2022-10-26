class User
  def initialize(usuario, clave, email)
    @usuario = usuario
    @clave = clave
    @email = email

  end

  def to_s

    "#{@usuario} <#{self.class})"
  end

  def ver(doc)
    doc.contenido if doc.puede_ser_visto_por? self
  end

  def modificar (docu, newcontenido)
    docu.contenido = newcontenido if docu.puede_ser_modificado_por? self
  end

  def borrar (docu)
    docu.borrar if docu.puede_ser_borrado_por? self
  end

  def puede_borrar?(docu)
    false
  end

  def puede_ver?(docu)
    false
  end

  def puede_modificar?(docu)
    false
  end
end

class Lector < User

  def puede_ver? (docu)
    docu.publico
  end

end

class Redactores < Lector

  def puede_ver? (docu)
    docu.publico || puede_modificar?(docu)
  end

  def puede_modificar?(docu)
    docu.creador == self
  end
end

class Directores < User

  def puede_modificar?(docu)
    true
  end

  def puede_ver?(docu)
    true
  end
end

class Administradores < Directores

  def puede_borrar?(docu)
    true
  end
end

class Documento
  attr_accessor :creador, :contenido, :publico, :borrado

  def initialize(usuario, publico = true, contenido = '')
    self.creador = usuario
    self.publico = publico
    self.contenido = contenido
    self.borrado = false
  end

  def borrar
    self.borrado = true
  end

  def puede_ser_visto_por?(usuario)
    !@borrado && usuario.puede_ver?(self)
  end

  def puede_ser_modificado_por?(usuario)
    !@borrado && usuario.puede_modificar?(self)
  end

  def puede_ser_borrado_por?(usuario)
    !@borrado && usuario.puede_borrar?(self)
  end
end

unlector = Lector.new "Juan", "Es secreto", "a@a.com"
unRedactor = Redactores.new "OtroJuan", " Es secreto ", " ab @a.com "
unDirector = Directores.new " OtroJuan ", "Es secreto", "ab@a.com"
unAdministrador = Administradores.new "OtroJuan", " Es secreto ", " ab@a.com "
unDocuPublico = Documento.new unRedactor, false, " Mucho texto "

puts unlector.ver unDocuPublico #puts unRedactor.ver unDocuPublico #puts unDirector.ver unDocuPublico #puts unAdministrador.ver unDocuPublico
puts unlector.modificar unDocuPublico, "Modifique como lector "
puts unRedactor.modificar unDocuPublico, " Modifique como redactor "
puts unDirector.modificar unDocuPublico, " Modifique como director "
puts unAdministrador.modificar unDocuPublico, " Modifique como Administrador "
puts unlector.borrar unDocuPublico #puts unRedactor.borrar unDocuPublico #puts unDirector.borrar unDocuPublico #puts unAdministrador.borrar unDocuPublico
puts unlector.ver unDocuPublico #puts unRedactor.ver unDocuPublico #puts unDirector.ver unDocuPublico #puts unAdministrador.ver unDocuPublico
puts unlector.modificar unDocuPublico, "Modifique como lector"
puts unRedactor.modificar unDocuPublico, "Modifique como redactor"
puts unDirector.modificar unDocuPublico, "Modifique como director"
puts unAdministrador.modificar unDocuPublico, "Modifique como Administrador"
puts unlector.borrar unDocuPublico
puts unRedactor.borrar unDocuPublico
puts unDirector.borrar unDocuPublico
puts unAdministrador.borrar unDocuPublico
puts unlector.ver unDocuPublico
puts unRedactor.ver unDocuPublico
puts unDirector.ver unDocuPublico
puts unAdministrador.ver unDocuPublico
puts unlector.to_s
