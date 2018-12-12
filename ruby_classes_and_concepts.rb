# $: Will show you the Load Path. This is an Array with a list of the files that the Ruby interpreter will look through to include in your program. You can add / modify the Load Path in a program file.
puts "$:"

#Load is the simplest and most fundamental way to load a file into the load path. You can load DURING a file program again, and it will RELOAD that file, including any CHANGES that have been made. This makes it handy for working in irb, for example, when you are modifying a files as you go and want to quickly reload the changes. 
load "./engines/engine.rb"

#Unlike Load, Require loads only ONCE - and saves/remembers that it did this loading. You must SPECIFY that you're looking to load in the local working directory (.). OR you can add the working directory to the load path: $: << . Require is the most commonly used Ruby method to include additional files. Strictly speaking, you don't include a file, you include a Feature: that's why you can drop the file extension (.rb, .c, .dll, etc.) from the file string.
#Also notice that require is what you use to include Gems. Which makes sense, *I think* because, why would you want to be looking in the local working directory for the Gem? Of course that path is going to be elsewhere.
require "./engines/engine.rb"
require "./engines/engine"
require "pry"
#Require Relative adds only one difference to Require: It INCLUDES the local Working Directory (.) in the Load Path. Thus you can bring in features 
require_relative "engines/engine.rb"
require_relative "engines/engine"


class Vehicle
  def initialize(name = "2019 Toyota")
    #Below @engine is an example of... Composition! Instead of INHERITING from Engine Class, Vehicle adds its instance methods and instance variables, by including a new engine object inside itself.
    @engine = Engine.new
    binding.pry
    @name = name
  end

  def print_license_plate
    puts self.id
  end

  #The below method is an example of Delegation (closely linked to Composition)... where you take methods made avaialble via Composition (by bringing in Engine.new) and give them your own method names in the new class - in a Law of Demeter-esque approach to creating your own method names within this class.
  def start_engine
    @engine.start_engine
  end
end

class MotorBoat < Vehicle
  def name
    puts "Here's my name, I think it should be the original?!"
    puts @name
    @name
  end

  def print_license_plate
  end

  #The name_the_boat method below is a SIMPLE Setter: you pass it an argument in parenthesis.
  def name_the_boat(name)
    @name = name
    puts @name
  end

  #The update_boat_name method uses the more "advanced" or sugary Ruby "=" to set the value - So a setter that will APPEAR like assigning a value to a variable, even though, like name_the_boat, you are really just passing an argument to a method. NOTE however, that it takes this appearance quite far: the method itself will RETURN the argument you pass it, as if the Setter method was a VARIABLE pointing to that value, RATHER THAN returning, as is standard, the value of the last line/expression of your method.
  def update_boat_name=(name)
   @name = name
   puts @name
  end
end

henrys_motorboat = MotorBoat.new
henrys_motorboat.name
henrys_motorboat.start_engine
henrys_motorboat.print_license_plate

#Two Setter Methods
henrys_motorboat.name_the_boat("The Henricus IV")
henrys_motorboat.update_boat_name = "Torpedo Chaser 2000"


new_engine = Engine::new
Engine::engine_lights

def for_counter(x)
  for x in 1...150
    puts x
    x+1
  end
end

for_counter(1)

i = 6
loop do
  i -= 1
puts "#{i}"
break if i <= 0
end

z = 7
while z<5 
  puts "Hey! #{z}"
  break if i <= 0
end

s = [["Napoleon", "Marshall Ney"], ["Wellington", "Nelson"]]

s.each do |army|
  army.each do |soldier|
    puts soldier
  end
end


2.times { puts "Hey Hey Hey!!" }

intro = "Please enter your favorite book:" 
puts intro
idea = gets
print "The best book is #{idea}"

a = [1,2,3]
b = a
b[0] = 4 
puts a

americans = { :african_americans => "black", 
              :caucasian => "white", 
              :native_americans => "red",
              :asian => "yellow" }


americans.each do |type, color|
  puts type, color
end

require "rails"
require "rspec-rails"
#require "pry"

class Henry
  def initialize
    @henrys_loves = "literature"
  end

  def fancy_pants
    puts @henrys_loves
  end
end

henry = Henry.new
henrys_stubbed_value = "actually cakes"
#henry.stub(:fancy_pants).and_return(henrys_stubbed_value)

def group_of_bros(greeting, *bros)
  bros.each do |bro|
   print greeting
   puts bro
  end
end 

group_of_bros("times up! ", "Henry", "Ara", "Finn", "Becky")

musicians_truth = "Händel is one of the most important composers." 
if musicians_truth.match(/H(a|ä)ndel/)
  puts "No matter how you spell Handel, you’ve gotta love him!"
end

amazing_string_array = %w[ love, dog, food, paris ]
amazing_string_hash = %w{ love => , dog, food, paris }
#doesn't work actually with hash

amazing_string_array.each do |word|
  puts word
end

amazing_string_hash.each do |word|
  puts word
end

puts amazing_string_array


becky_nolin = Henry.new
antonia = Henry.new
a = becky_nolin <=> antonia
b = "david" <=> 2

puts a
puts b


programming_language = 
case programming_language
  when "JS"
    puts "Websites!"
  when "Python"
    puts "Science!"
  when "Ruby"
    puts "Web apps!"
  else
    puts "I don’t know!"
end

#Polymorphism

class Cat
  def make_noise
    puts "meow! meow!"
  end
end

class Dog
  def make_noise
    puts "woof! woof!"
  end
end

#object.method(argument)

#vs.

#method(argument)

