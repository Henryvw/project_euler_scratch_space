require "pry"

def palindrome_checker(word)
  #Base Case #1 
  if word.length < 1
    puts "Palindrome!"
  #Base Case #2 / Sub-Problem Check
  elsif (word.byteslice(0) != word.byteslice(-1))
    puts "Not a Palindrome, boys!"
  #Recursive Part - Wind it down to repeat 
  else
    word.slice!(word.byteslice(0))
    word.slice!(word.byteslice(-1))
    palindrome_checker(word)
  end
end

palindrome_checker("big fat boobies")
