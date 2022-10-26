class Array
  def randomly(&block)
    if block
      dup.shuffle.map { |x| block.call(x) }
    else
      self.shuffle.to_enum
    end
  end
end

p [1, 2, 3, 4, 5].randomly {|x| x*2}
p [1, 2, 3, 4, 5].randomly
