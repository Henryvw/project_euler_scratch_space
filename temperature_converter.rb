puts __FILE__.__id__
puts __FILE__.+("_or_add_to_the_file_name_like_so")
puts "Reading Celsius temperature value from data file..." 
my_number = File.read("my_temperatures.rb")
celsius = my_number.to_i
fahrenheit = (celsius * 9 / 5) + 32
puts "The number is " + my_number
print "Result: "
puts fahrenheit
