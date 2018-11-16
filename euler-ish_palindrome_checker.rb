#Problem: How would I use recursion to design a function to check whether a word is a palindrome?

#Notes: What is the base case? Always ask this question in recursion! I hate to ask this question, because it hurts my brain! The base case in a palindrome is whether two characters match: the character at the start (character 0) and the character at the end (character -1). Then, the "incursive" or "reductive" part is  

    
def is_palindrome?(character)
    

def break_word_into_characters(word)
    if word <= 1
      puts "short Palindrome"
    

end
    
    word.each_char do |char|
        if char == 
char = word.byteslice
    if word.byteslice(0) == word.byteslice(-1)
        print "It's a palindrome!"
    else
        print "Nope: Nana"
    end
true

