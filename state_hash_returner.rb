state_hash = {
              "Connecticut" => "CT", 
              "Delaware" => "DE",
              "New Jersey" => "NJ",
              "Maryland" => "MD",
              "Virginia" => "VA",
              "Pennsylvania" => "PA",
              }

puts "Enter the name of a Mid-Atlantic state: "
state = gets.chomp

abbr = state_hash[state]
puts "The abbreviation is #{abbr}."
