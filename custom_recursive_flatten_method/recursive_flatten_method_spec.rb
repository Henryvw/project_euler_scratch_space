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
