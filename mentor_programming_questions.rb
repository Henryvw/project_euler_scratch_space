#In Ruby Debugger, -rdebug, or in Pry, why does Next get STUCK at one line?
#ANSWER FOUND: Because it is ITERATING or LOOPING through that line. In my example, I had over 1,000 units to loop through! So it SEEMED like it was stuck, but actually it was just, computer-like, repeating that line, that instruction, 1000 times!
#
#Why does it SKIP lines? (ANSWER FOUND: Because those lines are EMPTY)
