class SimpleFibonacciCalculator
  def add_past_two(f1, f2)
    #Definition of a Fibonacci - next one is equal to previous two summed
    f3 = f1 + f2
    puts "f2=#{f2}"
    #To re-start the cycle, the 2nd entrant to the equation is now the 3rd, and the first is now the second
    f1 = f2
    f2 = f3
    puts "the new, f3-ized f2 before the loop= #{f2}"
    while f3 < 40
      puts "f2 after the loop= #{f2}"
      add_past_two(f1, f2)
    end
  end

  #Below are 
  def output_fib_history(given_number)
    #Base Case #1 is if given_number is 0, Base Case #2 is if it is 1. These are the simplest Base Cases.
    if given_number >= 0
      if given_number == 0 or given_number == 1
        print "Here we're getting to 0s and 1s =", given_number

        return 1
      else
        #Base Case #3 and Base Case #4
        print " Here's the number before =", given_number
        print "Here's the sum =", output_fib_history(given_number-1) + output_fib_history(given_number-2)
        print "Here's the number after =", given_number

      end
    else
      "You're going into NEGATIVE territory here boy!"
    end
  end

  def count_and_calculate(my_number)
    # "i" below is a COUNT of days, weeks months, which is a part of Fibonacci problems in the real world. For example, whatever time or range element is considered for this Fibonacci problem. In the case of rabbits, months. 
    for i in 1..my_number
      print " ||Counting ", i, ": Fibonacci is => ", output_fib_history(i)
    end
  end
end

return_my_fibonacci = SimpleFibonacciCalculator.new

#return_my_fibonacci.add_past_two(1,2)
#
#return_my_fibonacci.count_and_calculate(7)
return_my_fibonacci.output_fib_history(4)
__FILE__.methods


