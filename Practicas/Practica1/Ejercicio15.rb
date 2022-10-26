def rotl3(string)
    string.tr 'A-Za-z', 'N-ZA-Mn-za-m'
  end

print rotl3("¡Bienvenidos a la cursada de TTPS Opcion Ruby!")