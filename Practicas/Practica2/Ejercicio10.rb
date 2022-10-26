module Countable
  def reset_invocations
    @invocations = 0
  end

  def increment_invocations
    @invocations += 1
  end

  def invocations_m
    @invocations
  end

  def self.set_sym(sym)
    @@sym = sym
  end

  def self.included (base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def count_invocations_of(sym)
      self.alias_method :old_sym, sym
      Countable.set_sym :old_sym
      self.alias_method sym, :invoke
    end
  end

  def invoke
    increment_invocations
    self.send(@@sym)
  end

  def invoked?(sym)
    p @invocations != 0
  end

  def invoked(sym)
    p @invocations
  end

end

class Greeter
  include Countable # Incluyo el Mixin

  def initialize
    reset_invocations
  end

  def hi
    puts "Hey!"
  end

  def bye
    puts "See you!"
  end

  count_invocations_of :hi
end


a = Greeter.new
b = Greeter.new

a.invoked? :hi
# => false
b.invoked? :hi
# => false
a.hi
# Imprime "Hey!"
a.invoked :hi
# => 1
b.invoked :hi
# => 0


