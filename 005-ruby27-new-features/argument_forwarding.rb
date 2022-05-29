def foo(a, b)
  p a, b
end

def bar(...)
  foo(...)
end

bar 1, 2
#=> 1, 2
