# Enumerator#produce is added to produce infinite sequences

# Fibonacci:
enum = Enumerator.produce([0, 1]) { [_2, _1 + _2] }
p enum.take(10).map &:first
#=> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
