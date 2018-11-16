class Engine
  def start_engine
    puts "Engine on!"
  end

  puts "#" * 90
  puts "Here's the callstack inside Engine Class and separate file line 7"
  puts caller
  puts "#" * 90
  def self.engine_lights
    puts "Engine lights!"
  end
end
