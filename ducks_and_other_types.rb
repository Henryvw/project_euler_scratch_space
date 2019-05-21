#Anti-Pattern That Duck Typing Replaces (Plastic)
class PlasticDuckToy
  def prepare_assembly(tools)
    tools.each do |tool|
      case tool
      when PlasticHeater
        tool.heat(self)
      when PlasticMoulder
        tool.pour(self)
      when PlasticPainter
        tool.spray(self)
      end
    end
  end
end

class PlasticHeater
  def heat(duck)
    puts "Heat 'er up!"
  end
end

class PlasticMoulder
  def pour(duck)
    puts "Pour that sucker in!"
  end
end

class PlasticPainter
  def spray(duck)
    puts "Spray that sucker ONNN!"
  end
end

plastic_duck = PlasticDuckToy.new
tools = [ PlasticHeater.new, PlasticMoulder.new, PlasticPainter.new ]
plastic_duck.prepare_assembly(tools)

# Proper Way - (DRYer and more clarity) Using Duck Typing (Rubber)
class RubberDuckToy
  def prepare_assembly(tools)
    tools.each do |tool|
      tool.assemble(self)
    end
  end
end

class RubberHeater
  def assemble(duck)
    puts "Heat 'er up!"
  end
end

class RubberMoulder
  def assemble(duck)
    puts "Pour that sucker in!"
  end
end

class RubberPainter
  def assemble(duck)
    puts "Spray that sucker ONNN!"
  end
end

rubber_duck = RubberDuckToy.new
tools = [ RubberHeater.new, RubberMoulder.new, RubberPainter.new ]
rubber_duck.prepare_assembly(tools)
