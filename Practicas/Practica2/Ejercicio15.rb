def da_nil?(&block)
  p block.call.nil?
end

da_nil? {}

da_nil? do
  'Algo distinto de nil'
end

