class C
  def x(value_for_a, recurse=false)
    a = value_for_a
    print "Here's the object id of 'self':"
    puts self.object_id
    puts "And here's the object id of the variable 'a':"
    puts a
    puts a.object_id
    if recurse
      puts "Calling myself (recursion)..."
      x("Second object id for the variable 'a'")
      puts "Back after recursion; here's 'a:'"
      puts a
      puts a.object_id
    end
  end
end

c = C.new
c.x("First value for a", true)
