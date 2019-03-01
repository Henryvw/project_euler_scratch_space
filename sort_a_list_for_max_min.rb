#Next Steps December 11, 2018:
#How does MIT Guttag implement Binary Search?
#More specifically, how does he compare the (smaller?) arrays to each other? What is he even SEARCHING for -- is it also a Max?
#How can I compare two arrays to one another? An array looping within another array looping? But then, where do I return those values to?
#
require "pry"

list_of_nums =  [1,2,3,4,5,6,7,10,200,203,49,201,33,55,2,1]


#MERGE it
#Assumes left and right are already-sorted lists
#Returns a new sorted list containing the same elements as (left + right) would contain
def merge(left_array, right_array, sort_condition)
  left_counter = 0
  right_counter = 0
  print "Initial result =", @merged_result = [], " "
  print left_array, " "
  print right_array, " "
  #While (both) the left array length is greater than the left counter 
  while (right_counter < right_array.length) and (left_counter < left_array.length)
    #If 45 < 77, add 45 to new, sorted array
    if sort_condition.call(left_array[left_counter], right_array[right_counter])
      @merged_result.append(left_array[left_counter])
      left_counter += 1
      puts "adding left side to result: #{left_array[left_counter]}"
      puts "counting up left_counter; it now = #{left_counter}"
    #If 45 > 77, add 77 to new, sorted array
    else
      @merged_result.append(right_array[right_counter])
      right_counter += 1
      puts "adding right side to result: #{right_array[right_counter]}"
      puts "counting up right_counter; it now = #{right_counter}"
    end
  end
    while (right_counter < right_array.length)
      #(i.e. there are REMAINING items in the LEFT array that need to be MERGED), and the right array is greater than the right counter (ditto for right array - remaining items to be merged. The counters tell you )
    #If added the LEFT, make sure to add the RIGHT back in 
      @merged_result.append(right_array[right_counter])
      puts "adding right side in case added left already: #{right_array[right_counter]}"
      right_counter += 1
    end

    while (left_counter < left_array.length)
      @merged_result.append(left_array[left_counter])
      puts "adding left side in case added right already: #{left_array[left_counter]}"
      left_counter += 1
    end

  puts "And now inside Merge - the result: #=> #{@merged_result}"
  return @merged_result
end

#SORT it
def divide_conquer_sort(list, sort_condition = lambda { |x,y| x < y })
  if list.length < 2
    puts "OK list is down to 1, moving to the next side. Shortened Array: "
    puts list
    return list
  else
    print "Middle Number Index = "
    puts middle_number_index = (list.length / 2)
    print " Middle Number Value = "
    puts middle_number = list[middle_number_index]
    puts "Now creating left array"
    left_array = divide_conquer_sort(list.take(middle_number_index))
    puts "Now creating right array"
    right_array = divide_conquer_sort(list.drop(middle_number_index))
    puts "In Divide + Conquer - About to merge", left_array, "and", right_array
    return (merge(left_array, right_array, sort_condition))
  end
end

divide_conquer_sort(list_of_nums)

#
#def sort_with_binary_sort(list)
#  split_up_array = []
#  list.each_slice(2) do |a|
#
#  end 
#end
#
##sort_with_binary_sort(list_of_nums)
#
#def find_max(a,b)
#  if a > b
#    puts a
#    return a
#  else
#    puts b
#    return b
#  end
#end
#
#
#def almost_cheating_way(list)
#  list.sort!
#  puts list.last
#end
#
#def find_max(list)
#  new_highest = list[0]
#
#  list.each_with_index do |n, i|
#    #Will only work for positive integers
#    puts i
#    if new_highest < n[i+1]
#      new_highest = new_highest
#    else 
#      new_highest = n[i+1]
#    end
#    puts new_highest
#    return new_highest
#  end
#end

#find_max(list_of_nums)

#sort_with_binary_sort(list_of_nums)
#almost_cheating_way(list_of_nums)

#def sort_with_inefficient_selection_sort(list)
#  #invariant - new list is sorted
#  sorted_list = []
#
#  for x in 1..(list.length - 1)
#    while
#      if x < y
#        sorted_list << x
#      end 
#    end
#  end
#end
#
#def find_max_in(list)

  #Can't You just go through the list... one by one, and say, "is x bigger than the next one? Then...remove the smaller one. Is it bigger than the next next one? Remove whichever is smaller
  #Loop through the array
  #Compare 1st value with 2nd value
  #How do I "get" the second value? // I COULD... maybe switch the array?
  #Compare Higher Value resulting with 3rd value
  #Repeat
#  for i in 2..list.length
#    list.each do |x|
#      if x 
#    end
#  end
#end
