class NikoRogler
  def self.return_dinner_day(day)
    good_days = ["Tomorrow", "Thursday", "Friday"]
    if good_days.include?(day)
      puts "Excellent! I look forward to dinner on #{day}."
    else
      puts "That's a little late, no?"
    end
  end

  def self.return_dinner_location(location)
    case
    when location == "Nikos WG"
      puts "OK, then Niko cooks"
    when location == "Henrys WG"
      puts "OK, then Henry cooks"
    else
      puts "Unknown location"
    end
  end

  def self.find_dinner_date(day, location)
    return_dinner_day(day)
    return_dinner_location(location)
  end
end

puts "What day would you like?"
favorite_time = gets.chomp

puts "What location would you like?"
favorite_location = gets.chomp

NikoRogler.find_dinner_date(favorite_time, favorite_location)
