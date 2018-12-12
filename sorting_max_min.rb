#Next Steps December 11, 2018:
#How does MIT Guttag implement Binary Search?
#More specifically, how does he compare the (smaller?) arrays to each other? What is he even SEARCHING for -- is it also a Max?
#How can I compare two arrays to one another? An array looping within another array looping? But then, where do I return those values to?
#
require "pry"

list_of_nums = [4,5,6,7,8,9,10,120,5]

def merge(left, right, sort_condition)
#Assumes left and right are already-sorted lists
#Returns a new sorted list containing the same elements as (left + right) would contain
  result = []
  i = 0
  j = 0
  while i < left.length and j < right.length
    if sort_condition(left[i].length, right[j].length)
      result.append(left[i])
      i += 1
    else
      result.append(right[j])
      j += 1
      while (j < right.length)
        result.append(right[j])
        j += 1
      end
    end
  end
  return result
end

def divide_conquer_sort(list, sort_condition = lambda { |x,y| x < y })
  if list.length < 2
    return list
    puts list
  else
    print "Middle Number Index= "
    print middle_number_index = (list.length / 2)
    print " Middle Number Value= ", middle_number = list[middle_number_index]
    binding.pry
    left_number = divide_conquer_sort(list.take(middle_number_index), sort_condition)
    right_number = divide_conquer_sort(list.drop(middle_number_index), sort_condition)
    puts "About to merge", left_number, "and", right_number
    left_array = []
    right_array = []
    left_array << left_number
    right_array << right_number
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
