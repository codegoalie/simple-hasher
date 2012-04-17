require "./lib/simple-hasher/version"

module Simple
  module Hasher
    ALLOWED_CHARS = "CLK0oXklU2d6RvTrS1aDBx9GfN3e7FnQOtsmPi85MYq4AWHbZIuwJEgjVhpzyc"

    def self.encode(id)
      length = ALLOWED_CHARS.length

      while id > length -1
        hash = ALLOWED_CHARS[id % length,1].concat( hash || "" )
        id = (id / length).floor
      end

      ALLOWED_CHARS[id,1].concat(hash || "")
    end

    def self.decode(hash)
      length = ALLOWED_CHARS.length
      size = hash.length - 1
      array = hash.split('')
      id = ALLOWED_CHARS.index(array.pop)
      i = 0
      array.each do |c| 
        id += ALLOWED_CHARS.index(c) * (length ** (size - i))
        i += 1
      end
      id
    end
  end
end
