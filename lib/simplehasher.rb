class SimpleHasher

  def self.encode(id)
    length = self.config.allowed_chars.length

    while id > length -1
      hash = self.config.allowed_chars[id % length,1].concat( hash || "" )
      id = (id / length).floor
    end

    self.config.allowed_chars[id,1].concat(hash || "")
  end

  def self.decode(hash)
    length = self.config.allowed_chars.length
    size = hash.length - 1
    array = hash.split('')
    id = self.config.allowed_chars.index(array.pop)
    i = 0
    array.each do |c| 
      id += self.config.allowed_chars.index(c) * (length ** (size - i))
      i += 1
    end
    id
  end

  def self.allowed_chars
    self.config.allowed_chars
  end

   # Handles the configuration values for the module
  class Config
    attr_accessor :allowed_chars

    def initialize
      @allowed_chars = "CLK0oXklU2d6RvTrS1aDBx9GfN3e7FnQOtsmPi85MYq4AWHbZIuwJEgjVhpzyc"
    end
  end

  # Returns of initializes the Module configuration
  def self.config
    @@config ||= Config.new
  end

  # Allows for setting config values via a block
  def self.configure
    yield self.config
  end
end
