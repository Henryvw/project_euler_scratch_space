

array_of_integers_under_10 = [1,2,3,4,5,6,7,8,9]
range_of_integers_under_1000 = 1..999

array_of_integers_under_1000 = []
puts array_of_integers_under_1000

range_of_integers_under_1000.each do |range_element|
  array_of_integers_under_1000 << range_element
end 

puts array_of_integers_under_1000

#Divide by 3
#
#Divide by 5
#
# if divisible by 3, add to new array
#
# If divisibable by 5, add to new array
#
#
array_of_integers_multiples_of_3_or_5 = []

def select_integers_multiples_of_3_or_5(raw_array_of_integers, new_array_3_and_5)
  raw_array_of_integers.each do |raw_integer|
    if raw_integer % 3 == 0
    puts "#" * 90
    puts caller
    puts "#" * 90
      new_array_3_and_5 << raw_integer
      puts "#{raw_integer} divisible by 3 and added!"
    elsif raw_integer % 5 == 0
      new_array_3_and_5 << raw_integer
      puts "#{raw_integer} disivible by 5 and added!"
    else
      puts "#{raw_integer} not divisible"
    end
  end
  puts "And here's the final array of integers and their sum:"
  sum = 0
  new_array_3_and_5.each do |selected_integer|
    puts "Integer: #{selected_integer}"
    sum = selected_integer + sum 
  end
  puts "Sum: #{sum}"
end

select_integers_multiples_of_3_or_5(array_of_integers_under_1000, array_of_integers_multiples_of_3_or_5)

