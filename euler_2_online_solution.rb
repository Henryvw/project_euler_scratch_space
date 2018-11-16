sum = 0
x = 1
y = 2

while y < 4000000
  sum += y if y.even?
  x = y
  y = x + y
end

puts sum
