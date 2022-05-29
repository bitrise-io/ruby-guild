# New methods added to Enumerable

p %w(a a a b b c).tally
#=> {"a"=>3, "b"=>2, "c"=>1}

# filter_map = select + map
p (1..8).select { |n| n.even? }.map { |n| n ** 2 }
# slightly shorter but probably harder to read:
p (1..8).select(&:even?).map { |n| n ** 2 }
# can now be written as:
p (1..8).filter_map { |n| n ** 2 if n.even? } # filters out falsey (false, nil) values

# readability aliases:
[1, 2, 3] | [2, 3, 4] == [1, 2, 3].union([2, 3, 4])
[1, 2, 3] - [2, 3, 4] == [1, 2, 3].difference([2, 3, 4])
# the top 2 were already available but this is new:
[1, 2, 3] & [2, 3, 4] == [1, 2, 3].intersection([2, 3, 4])
