#My implementation for Merge Sort. Use Divide and Conquer to break down the array
require "pry"

list_of_nums =  [1,2,3,4,5,6,7,10,200,203,49,201,33,55,2,1]

#MERGE it
#Assumes left and right are already-sorted lists
#Returns a new sorted list containing the same elements as (left + right) would contain
def merge(left_array, right_array, sort_condition)
  left_counter = 0
  right_counter = 0
  @merged_result = []
  #While (both) the left array length is greater than the left counter (i.e. there are REMAINING items in the LEFT array that need to be MERGED), and the right array is greater than the right counter (ditto for right array - remaining items to be merged. The counters tell you... what exactly?)
  while (right_counter < right_array.length) and (left_counter < left_array.length)
    #If left < right, add left to new, sorted array
    if sort_condition.call(left_array[left_counter], right_array[right_counter])
      @merged_result.append(left_array[left_counter])
      left_counter += 1
      puts "adding left side to result: #{left_array[left_counter]}"
      puts "counting up left_counter; it now = #{left_counter}"
    #Else if left > right, add right to new, sorted array
    else
      @merged_result.append(right_array[right_counter])
      right_counter += 1
      puts "adding right side to result: #{right_array[right_counter]}"
      puts "counting up right_counter; it now = #{right_counter}"
    end
  end
    #If added the LEFT, make sure to add the RIGHT
    while (right_counter < right_array.length)
      @merged_result.append(right_array[right_counter])
      puts "adding right side in case added left already: #{right_array[right_counter]}"
      right_counter += 1
    end
    #If added the RIGHT, make sure to add the LEFT
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
