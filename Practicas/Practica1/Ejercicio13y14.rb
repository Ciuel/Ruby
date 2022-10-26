def listar(map, glue = ':')
    keys = map.keys.each.with_index(1)
    keys.map do
      key, nbr = keys.next
      "#{nbr} #{key} #{glue} #{map.fetch(key)}"
    end
  end
  
puts listar({ perros: 2, gatos: 2, peces: 0, aves: 8