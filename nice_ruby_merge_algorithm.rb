require 'pry'
# The key to the merge sort algorithm is to break the problem into two functions. 
#
# The first public function (classically called "mergesort") splits itself in half, 
# and assigns a variable to each half ("left" and "right" below). 
# The second function is classically called "merge." It MERGES two halves (two arrays).
# By having the public "mergesort" function CALL merge at the end with ITSELF -- mergesort -- 
# as a method RECURSIVELY called to calculate the two arguments to merge, 
# You trigger the following process. mergesort halves itself until it has 2, 1-item arrays. 
# Then, INSIDE OF THAT stack-frame it calls MERGE and compares each half. Then, it returns an ordered array. 
# This continues in a backward spiral, merging ever-growing arrays. 
# The merge function goes through EVERY item in each list and compares it with its counterpart. 
# Then the right side follows the same recursive curly-cue spiral until it has divided, 
# compared and merged its items, and then the final merge completes bringing both back 
# into the merge function. A key point to understand here is that the "sorted" array 
# inside MERGE gets refreshed and returned at the end of each merge. At the end of a cycle, 
# the return value of the public merge_sort IS the return value of merge. 
# So the values of the sorted arrays are passed back upwards as you move back up the 
# tree of calls, if that makes sense. Thus you end up with two arrays on the final round, 
# submitted to merge, which then returns its "sorted" value with the complete array.
#
# Merge itself iterates through the items, comparing each first item to the next one, 
# discarding it, and then adding it to the merged array. BECAUSE OF THE FACT that the 
# two arrays THEMSELVES are already ORDERED, this process is SAFE to know that each 
# item you add is definitely lower than the remaining items in the other half. 
# The final concat method calls simply catch the very last item in the array, on whichever side it's on. That's it. 
def mergesort(list)
  return list if list.size <= 1
  mid = list.size / 2
  left = list[0...mid]
  right = list[mid...list.size]
  merge(mergesort(left), mergesort(right))
end

def merge(left, right)
  sorted = []
  # The below UNTIL conditional checks whether the left and right have any items left UNshifted into the new @sorted array.
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  puts caller
  sorted.concat(left).concat(right)
end

puts mergesort([2,3,4,1])
