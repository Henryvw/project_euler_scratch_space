class Engine
  def initialize
    puts "Initializing... now! An object allocated with the POWER to accept and return values according to the methods defined on the Engine class is now, instantly, created!"
  end

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

  def self.all
    puts "damn"
  end

  def Engine.all_my
    puts "damn damn"
  end

  def Engine::all_my_my
    puts "damn damn damn"
  end
end

bonny = Engine.new
bonny.start_engine

Engine.all
Engine.all_my
Engine.all_my_my
