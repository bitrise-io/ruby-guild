# Considered experimental in 2.7
# https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7

people = {
  name: 'Alice',
  age: 30,
  children: [{name: 'Bob', gender: 'male', age: 2}]
}

case people
in {name: 'Alice', children: [{name: name, gender: 'male', age: age}]}
  p name, age #=> 'Bob', 2
end

# You can use guard conditions (if|unless) for the match
case [1, 2]
in [a, b] unless a == b
  p a, b #=> 1, 2
end

# Using an existing variable for a pattern match
a = 1
case 1
in ^a
  p a #=> 1
end

# Matching for a type expression
case 1
in Integer => i
  p i #=> 1
end

# Lots of other syntactic "sugar"
case {a: 1, b: 2, c: 3}
in a:, **rest
  p a, rest #=> 1, {:b=>2, :c=>3}
end

# Can be used for assignments without the `case` statement (destructuring)
[1, 2, 3, 4, 5] in [first, *rest]
p first, rest
#=> 1, [2, 3, 4, 5]

{a: 10, b: 20, c: []} in {a: x, b: 20, c: []}
p x
#=> 10
