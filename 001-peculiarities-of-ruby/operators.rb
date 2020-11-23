# Ruby allows you to overload most operators that work on an object
#  - that's because most operators are actually methods!

p 1 + 2
# => 3

p 1.+(2)
# => 3

class Number
  def initialize(number)
    @value = number
  end

  def +(v)
    @value + v
  end

  def -(v)
    @value - v
  end

  def -@
    -@value
  end

  def [](index)
    @value.to_s(2)[index]
  end
end

a = Number.new(5)
p a + 2
# => 7

p -a
# => -5

p a[2] # a.[](2)
# => "1"


class BetterString < String
  def |(other_string)
    self + other_string
  end
end

s = BetterString.new 'alma'
p s | 'fa'
# => "almafa"
