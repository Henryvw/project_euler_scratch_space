#require_relative "engines/engine"
#require_relative "engines/engine.rb"

#require "./engines/engine.rb"
require "./engines/engine"

class Vehicle
  def initialize
   @engine = Engine.new
   @name = ""
  end

  def print_license_plate
    puts self.id
  end

  def start_engine
    @engine.start_engine
  end
end

class MotorBoat < Vehicle
  def print_license_plate
  end

  def name_the_boat(name)
    @name = name
    puts @name
  end 
end

henrys_motorboat = MotorBoat.new
henrys_motorboat.start_engine
henrys_motorboat.print_license_plate
henrys_motorboat.name_the_boat("The Henricus IV")


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

