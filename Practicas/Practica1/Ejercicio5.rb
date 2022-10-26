def reemplazar(string) 
    string.sub("{","do\n").sub("\nend")
  end
  
  puts reemplazar("3.times { |i| puts i }'')