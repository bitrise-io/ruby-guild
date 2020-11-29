# Getter/setters - we usually don't use the get_property / set_property naming convention

class A
  def token
    @token
  end

  def token=(token)
    @token = token
  end
end

a = A.new
a.token = 'a token'
p a.token
# => "a token"

# Or you can just do this

class B
  attr_accessor :token
end

b = B.new
b.token = 'another token'
p b.token
# => "another token"


# Boolean methods end with a ? suffix

def even?(number)
  number % 2 == 0
end

p even? 2
# => true


# Methods that end with an ! need attention

# Maybe they raise an error
def validate_even!(number)
  raise ArgumentError unless even? number
end

# Or they may mutate state
array = [3, 1, 2]
array.sort!
p array
# => [1, 2, 3]
