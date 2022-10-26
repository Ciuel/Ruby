def longitud (*args)
  args.map(&:to_s).map { |elem| "#{elem} --> #{elem.length}\n" }
end

puts longitud(9, Time.now, 'Hola', { un: 'hash' }, :ruby)
