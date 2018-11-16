LIST_OF_FIBONACCI_NUMBERS = [0]
EVEN_FIBONACCI_NUMBERS = []

class FibonacciCalculator
  def summed
    @summed
  end

  def generate_below_four_million(first_fibonacci, second_fibonacci)
    LIST_OF_FIBONACCI_NUMBERS << first_fibonacci
    LIST_OF_FIBONACCI_NUMBERS << second_fibonacci

    past_sum = first_fibonacci
    current_sum = second_fibonacci

    while current_sum < 4000000
      transition_sum = current_sum
      current_sum = current_sum + past_sum
      past_sum = transition_sum
      LIST_OF_FIBONACCI_NUMBERS << current_sum
    end
  end
  
  def recursive_base_case(first_fibonacci, second_fibonacci, limit)
    #The problem: is that the array that should be a list of one fibonacci after another, instead gets to the LIMIT, and adds the LAST fibonnaci before the limit to the array OVER and OVER again.
    #
    puts "First Fibonacci #{first_fibonacci}"
    puts "Second Fibonacci #{second_fibonacci}"

    LIST_OF_FIBONACCI_NUMBERS << second_fibonacci
    puts "LIST OF FIBONACCI NUMBERS Array: #{LIST_OF_FIBONACCI_NUMBERS}"
    puts "Second Fibonacci Again #{second_fibonacci}"
    
    sum_ie_next_fibonacci = first_fibonacci + second_fibonacci
    puts "Sum of 2 Fibonaccis - i.e. the Next fibonacci #{sum_ie_next_fibonacci}" 
    first_fibonacci = second_fibonacci
    puts "New First Fibonacci #{first_fibonacci}"

    second_fibonacci = sum_ie_next_fibonacci
    puts "New Second Fibonacci #{second_fibonacci}"
    puts "I'm here now - OUTside the While Loop"
    while sum_ie_next_fibonacci < limit
      puts "Sum - ie Next Fibonacci #{sum_ie_next_fibonacci}"
      puts "LIST OF FIBONACCI NUMBERS Array - last (-1) item: #{LIST_OF_FIBONACCI_NUMBERS[-1]}"
      recursive_base_case(first_fibonacci, second_fibonacci, limit)
      puts "I'm here now - INside the While Loop"
    end
      puts "I'm here now - INside the While Loop"
  end

  def generate_using_recursion(first_fibonacci, second_fibonacci, limit)
    puts "LIST OF FIBONACCI NUMBERS Array - last (-1) item: #{LIST_OF_FIBONACCI_NUMBERS[-1]}"
    recursive_base_case(first_fibonacci, second_fibonacci, limit)
  end

  def find_evens(list)
    list.each do |fib_value|
      if fib_value % 2 == 0
        EVEN_FIBONACCI_NUMBERS << fib_value
      else
        puts "#{fib_value} aint even, baby!"
      end
    end
  end

  def sum_list(numbers)
    @summed = 0
    numbers.each do |number|
      @summed = @summed + number
    end
  end
end

fibonacci_calculator = FibonacciCalculator.new

#fibonacci_calculator.generate_below_four_million(1,2)
#fibonacci_calculator.find_evens(LIST_OF_FIBONACCI_NUMBERS)
#fibonacci_calculator.sum_list(EVEN_FIBONACCI_NUMBERS)
puts "EXTERNAL last Fib in LIST Array: #{LIST_OF_FIBONACCI_NUMBERS[-1]}"

fibonacci_calculator.generate_using_recursion(1, 2, 14)

puts "Here are all the Fibonacci values below 4 million:" 
puts LIST_OF_FIBONACCI_NUMBERS
puts "Here is the list of the EVEN Fibonacci Numbers in that list:"
puts EVEN_FIBONACCI_NUMBERS
puts "How lovely!"
puts "Here is the answer, the SUM of those EVENS!"
puts "Ta Da! Here: #{fibonacci_calculator.summed} How Exciting"
