class AbsoluteValue
  def positivize(number)
    if number.negative?
      positive_double = number * number
      positive_number = positive_double / 2
      positive_number  
    else 
      return number
    end
  end 
end

x = 12345.0
closeness_to_square_root = 0.0000001
num_guesses = 0
low = 0.0

if x < 1.0
  high = 1.0
  print "High set to 1.0 because number being tested is below 1.0 and so the square root will be less than 1.0 and needs to be searched for there. High==", high, "  "
else
  high = x
  print "The number is higher than 1, so the square root can't be higher than the number itself. High==", high, "  "

end

#Problem #1: Core Problem is that my function doesn't work the way Guttag's does for fractions / decimals. It always returns 0.5.
#Hypothesis #1: The "max" function in Python returns somthing different from just returning either the higher number of 1.0. Seems very odd, but possible? What is his function returning?  
#The problem is that a) 
#

answer = (high + low) / 2.0
absolute = AbsoluteValue.new
while absolute.positivize((answer * answer - x)) >= closeness_to_square_root && answer <= x
  print "Answer times itself minus x=", answer**2 - x, "  "
  print "answer= ", answer, "  "
  print "high= ", high, "  "
  print "low= ", low, "  "
  print "number of guesses= ", num_guesses, "  "

  num_guesses += 1
  if answer**2 < x
    low = answer
  else
    high = answer
  end
  answer = (high + low) / 2.0
end

print "Number of guesses is "
puts num_guesses
print answer, " is close to square root of ", x

