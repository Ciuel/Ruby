require 'English'
def ejercicio17(*params, &block)
  begin
    block.call(params)
    #raise RuntimeError
    return :ok
  rescue
    p $ERROR_INFO.class
    if $ERROR_INFO.instance_of?(RuntimeError)
      puts 'Hay algo mal que no anda bien'
      return :rt
    end
    if $ERROR_INFO.instance_of?(NoMethodError)
      puts "Y este método?\n #{$ERROR_INFO}"
      return :nm
    end
    puts 'Y ahora?'
    raise
  else
    :ok
  end
end

ejercicio17("a","b","c") {|x| x.map(:downcase)}
ejercicio17("a","b","c") {|x| x.map(&:dwncase)}
ejercicio17("a","b","c") {|x| x.map(&:downcase)}