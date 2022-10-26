class TrueClass
  def opposite
    false
  end
end

class FalseClass
  def opposite
    true
  end
end

p false.opposite
# => true
p true.opposite
# => false
p true.opposite.opposite
# => true
