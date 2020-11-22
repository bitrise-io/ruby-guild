# In Ruby, every expression has a return value

p a = 1
# => 1

p a = b = 2 # a = (b = 1)
# => 2

a = if 1 == 1
      3
    else
      4
    end
p a
# => 3

def one
  # A function's return value is the value of its last expression
  1
end
p one
# => 1

# Even function and class definitions have return values
p def two
  2
end
# => :two

p class A
  end
# => nil

# You can have multiple return values
def returns_two
  [1, 2]
end

p returns_two
# => [1, 2]

# You can "destructure" them like in JS or Go
a, b = returns_two
p a, b
# => 1, 2
