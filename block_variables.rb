require "pry"

class BlockVariables
  def self.block_local_variables
    x = 100
    [1,2,3].map do |y|
      puts "Parameter y is #{y}"
      y = y + 10
      @y = y
      puts "Reassigned to x in block; it's now #{y}"
      x = 400
    end
    puts "Here is the y #{@y}" 
    puts "Outer x is still #{x}"
  end

  def self.block_scope_demo
    x = 100  #variables set outside 
    y = 5
    1.times do |y|   #y is now also a parameter
      x = 200
      y = y + 1
      z = 350
    end
    puts x
    puts y
    begin 
      puts z
    rescue 
      NameError
      puts "Aint notin in Z"
    end
  end

  def method_with_block_argument(a, b:, &block)
    p a
    p b
    yield
    puts r.inspect
    # Yield is necessary here if you want to pass in a block, otherwise it won't know where to execute itself
  end
end

#BlockVariables.block_local_variables
BlockVariables.block_scope_demo
bv = BlockVariables.new

bv.method_with_block_argument(1, b: "hey") {puts "BAM"}
