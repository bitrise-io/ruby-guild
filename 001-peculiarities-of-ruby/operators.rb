# Ruby allows you to overload most operators that work on an object
#  - that's because most operators are actually methods!

p 1 + 2
# => 3

p 1.+(2)
# => 3

class A
  def initialize(number)
    @value = number
  end

  def +(v)
    @value + v
  end

  def -(v)
    @value - v
  end
end

a = A.new(5)
p a + 2
# => 7


class BetterString < String
  def |(other_string)
    self + other_string
  end
end

s = BetterString.new 'alma'
p s | 'fa'
# => "almafa"
