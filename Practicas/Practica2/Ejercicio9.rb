module Reverso
  def di_tcejbo
    self.object_id.to_s.reverse
  end

  def sslac
    self.class.to_s.reverse
  end
end

class Obj
  include Reverso
end

o = Obj.new
puts o.di_tcejbo
puts o.sslac