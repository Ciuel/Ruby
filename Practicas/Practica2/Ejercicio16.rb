def procesar_hash(hash, block)
  hash.transform_keys { |x| block.call(x) }.invert
end

hash = { 'clave' => 1, :otraclave => 'valor' }
procesar_hash(hash, ->(x) { x.to_s.upcase })
