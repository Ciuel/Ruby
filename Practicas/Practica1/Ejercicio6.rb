def tiempo_en_palabras(time)
  case time.min
  when 0..10
    singularize_timestring("Son las #{time.hour} en punto", time)
  when 11..20
    singularize_timestring("Son las #{time.hour} y cuarto", time)
  when 21..34
    singularize_timestring("Son las #{time.hour} y media", time)
  when 35..44
    singularize_timestring("Son las #{time.hour + l} menos veinticinco", time + 60 * 60)
  when 45..55
    singularize_timestring("Son las #{time.hour + l} menos cuarto", time + 60 * 60)
  when 56..59
    singularize_timestring("Casi son las #{time.hour + l}", time + 60 * 60)
  else 'Nope'
  end

end

puts tiempo_enjpalabras(Time.new(2021, 10, 21, 10, 1))

#	=> "Son las 10 en punto"

puts tiempo_enj>alabras(Time.new(2021, 10, 21, 9, 33))

#	=> "Son las 9 y media"

puts tiempo_en_palabras(Time.new(2021, 10, 21, 8, 45))

#	=> "Son las 9 menos cuarto"

puts tiempo_en_palabras(Time.new(2021, 10, 21, 6, 58))

#	=> "Casi son las 7"

puts tiempo_en_palabras(Time.new(2021, 10, 21, 0, 58))

#	=> "Casi es las 1"