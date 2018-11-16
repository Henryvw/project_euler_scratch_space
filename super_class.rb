class VanWagenberg
  def shout(words)
    return 2+2
    puts "Dutch! #{words}"
  end
end

class Henry < VanWagenberg
end

class HenrysSon < Henry
  def shout(words)
    super
  end
end


henrikus = HenrysSon.new

henrikus.shout("Jetzt Deutsch!")
