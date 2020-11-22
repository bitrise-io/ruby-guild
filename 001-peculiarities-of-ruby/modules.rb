# You can use modules as packages to group functions

module StringUtil
  def self.palindrome?(string)
    string.delete(' ') == string.reverse.delete(' ')
  end

  # This syntax works the same but has some added benefits (like having private class methods)
  class << self
    def snake_case(string)
      string.gsub ' ', '_'
    end
  end
end

p StringUtil.palindrome? 'never odd or even'
# => true

p StringUtil.snake_case 'never odd or even'
# => "never_odd_or_even"

# Modules can't be instantiated
begin
  StringUtil.new
rescue NoMethodError => ex
  p ex
  # => #<NoMethodError: undefined method `new' for StringUtil:Module>
end


# You can also use modules as mixins

require 'logger'

module MyLogger
  def logger
    Logger.new(STDOUT)
  end
end

class Logic
  include MyLogger

  def do_something
    logger.info "I'm doing something"
  end
end

logic = Logic.new
logic.do_something
# => I, [2020-11-22T11:58:29.193579 #49120]  INFO -- : I'm doing something

# In this case you can't call MyLogger.logger because the MyLogger class (module) doesn't have a logger method,
# only "instances" of MyLogger do
begin
  MyLogger.logger
rescue NoMethodError => ex
  p ex
  # => #<NoMethodError: undefined method `logger' for MyLogger:Module>
end


# And if you ever need a module that's both a package and a mixin, then you can just do this:
module MixedUsage
  extend self

  def hello
    "hello"
  end
end

class T
  include MixedUsage
end

p T.new.hello
# => "hello"
p MixedUsage.hello
# => "hello"
