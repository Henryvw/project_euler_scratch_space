require 'rspec'

# Monkey Patch on Array so we can already use it on any array object
class Array
  # I want to have the nice form of array_object DOT method, so I need to pass self in outside of the recursion
  def flatten_me
    incoming_array = self
    recursive_flatten(incoming_array)
  end

  # Expose as few methods as possible
  private
  # Create new_flattened_array optionally so it doesn't get over-written during recursion 
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

henrys_array = [[5,6],1,2,3,[2,[3,4],4]]
puts henrys_array.flatten_me

#Spec
describe Array do
  describe '#flatten_me' do
    it 'should return an already-flat array unchanged' do
      test_array = [1,2,3]
      expect(test_array.flatten_me).to eq test_array
    end

    it 'should flatten an array with one array listed inside' do
      test_array = [1,2,3,[4,5],6]
      flattened_test_array = [1,2,3,4,5,6]
      expect(test_array.flatten_me).to eq flattened_test_array 
    end

    it 'should flatten an array with any depth of arrays inside' do
      test_array = [1,[2,[3,[4,[5]]]]]
      flattened_test_array = [1,2,3,4,5]
      expect(test_array.flatten_me).to eq flattened_test_array
    end

    it 'should flatten arrays with any common data types' do
      test_array = [1,2,3,[["gee", "whiz"], [3.0]],6]
      flattened_test_array = [1,2,3,"gee", "whiz", 3.0, 6]
      expect(test_array.flatten_me).to eq flattened_test_array
    end
  end
end
