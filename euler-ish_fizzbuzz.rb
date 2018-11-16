for i in (1..100)
  if i % 3 == 0 || i % 5 == 0 
    fizzy_string = " "
    if i % 3 == 0
      fizzy_string = fizzy_string + "Fizz"
    end
    if i % 5 == 0
      fizzy_string = fizzy_string + "Buzz"
    end
    puts i.to_s + fizzy_string
  end
end
 
