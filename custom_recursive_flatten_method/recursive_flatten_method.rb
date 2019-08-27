# Monkey Patch Array so we can already use my method on any array object
class Array
  # I want to have the nice form of array_object DOT method, so I need to pass self in outside of the recursion
  def flatten_me
    incoming_array = self
    recursive_flatten(incoming_array)
  end

  # Expose only one method
  private
  # Create new_flattened_array optionally (and later pass it in) so it doesn't get over-written during recursion 
  def recursive_flatten(incoming_array, new_flattened_array = [])
      incoming_array.each do |item|
      if item.class == Array
        # Recursion
        recursive_flatten(item, new_flattened_array)
      else
        new_flattened_array << item
      end
    end
    new_flattened_array
  end
end