class Palabra
  def initialize(content)
    @pal = content
  end

  def vocales
    @pal.scan(/[aeiou]{l}/i).uniq
  end

  def consonantes
    @pal.scan(/[^aeiou]{l}/i).uniq
  end

  def longitud
    @pal.length
  end

  def es_panvocalica?
    !(@pal =~ /a+/i && @pal =~ /e+/i && @pal =~ /i+/i && @pal =~ /o+/i && @pal =~ /u+/i).nil?
  end

  def es_palindroma?
    return false if @pal.length < 3
    if @pal.length % 2 == 0
      return true if @pal.slice(0, @pal.length / 2).reverse == @pal.slice(@pal.length / 2, @pal.length)
    else
      return true if @pal.slice(0, @pal.length / 2).reverse == @pal.slice(@pal.length / 2, @pal.length)[1..-1]
    end
  end

  def gritando
    @pal.upcase
  end

  def en_jaquer
    subs = { "a": "4", "e": "3", "i": "1", "o": "0", "u": "2" }
    p @pal.chars.map { |c| subs[c.to_sym] || c }.join
  end

end

pal = Palabra.new("murcielago")
pal = Palabra.new("neuquen")
pal = Palabra.new("aaltlaa")
met = Palabra.instance_methods(false)
met.each { |x| p pal.send(x) }