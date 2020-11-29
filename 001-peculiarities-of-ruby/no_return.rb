# Every expression has a return value

p a = 1
# => 1

p a = b = 2 # a = (b = 2)
# => 2

a = if true
      3
    else
      4
    end
p a
# => 3

def one
  # A function's return value is the value of its last expression => no need for a return statement
  1 # return 1
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
def returns_multiple
  [1, 2, 3]
end

p returns_multiple
# => [1, 2, 3]

# You can "destructure" them like in JS or Go
a, _, b = *returns_multiple
p a, b
# => 1, 3
