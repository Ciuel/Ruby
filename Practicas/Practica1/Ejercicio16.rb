def rot(string, shift)
    string.tr 'A-Za-z', ('A'..'Z').to_a.rotate(shift).join + ('a'..'z').to_a.rotate(shift).join
  end

  rot("¡Bienvenidos a la cursada 2022 de TTPS Opción Ruby!", 13)