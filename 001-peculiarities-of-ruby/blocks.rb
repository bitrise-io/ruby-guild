hello_lambda = -> do
  p 'hello'
end

hello_lambda.call
# => "hello"

# Single line format

p [1, 2, 3].map { |n| n * 2 }
# => [2, 4, 6]


# Every function can have an implicit block parameter

def having(condition)
  yield if condition
end

having 1 == 1 do
  p 'it worked'
end
# => "it worked"


def map(array)
  result = []
  array.each { |e| result << yield(e) }
  result
end

p map([1, 2, 3]) { |n| n * 2 }
# => [2, 4, 6]


# You can declare the block parameter explicitly if you want to do something with it (e.g. run it in a specific context)

def with(v, &block)
  v.instance_exec &block
end

with 1 do
  p self + 1
end
# => 2
