# Everything is an object

p 1.class
# => Integer

1.upto 5 do |i|
  # If you ever need a for loop in Ruby - though you probably won't
end

5.times { |i| '...' }

# Even classes are objects
p Integer.class
# => Class

# In fact, we're running in an Object right now!
p self.class
# => Object


# Objects can be "manipulated"

o = Object.new
def o.i_am_the_one
  'I am the one!'
end
p o.i_am_the_one
# => "I am the one!"

o2 = Object.new
begin
  o2.i_am_the_one
rescue NoMethodError => ex
  p ex
  # => #<NoMethodError: undefined method `i_am_the_one' for #<Object:0x00007f805b8a1488>>
end


# Classes can be modified as well - even the system ones! ... this is called monkey patching

class String
  def palindrome?
    self.delete(' ') == self.reverse.delete(' ')
  end
end

p 'never odd or even'.palindrome?
# => true

# Rails (ActiveSupport) monkey patches the living cr@p out of the system classes
require 'active_support/core_ext'

p 1.day.ago
# => 2020-11-21 12:33:50.61151 +0100


# Remember our Logging example?

require 'logger'

module MyLogger
  def logger
    Logger.new(STDOUT)
  end
end

# We can include this module into the Object class and every object will have its own logger
include MyLogger

1.logger.info "I'm the one!"


# This also allows you to extend the language

class Class
  def attribute(name)
    define_method name do
      instance_variable_get :"@#{name}"
    end

    define_method :"#{name}=" do |value|
      instance_variable_set :"@#{name}", value
    end
  end
end

class HasAttribute
  attribute :prop
end

a = HasAttribute.new
a.prop = 2
p a.prop
# => 2

# Remember attr_accessor earlier? We just implemented it (by a different name)...
