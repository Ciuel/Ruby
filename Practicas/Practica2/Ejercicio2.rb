def ordenar(*elems)
  print elems.flatten.sort
end

print ordenar 1, 4, 6, 2, 3, 5, 0, 10, 9
# => [0, 1, 2, 3, 4, 5, 6, 9, 10]
#Ejercicio 3
puts
print ordenar([10, 9, 1, 2, 3, 5, 7, 8])