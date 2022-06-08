# Automatic conversion of keyword arguments and positional arguments is deprecated and removed in Ruby 3.
#
# - Using the last argument as keyword parameters is deprecated, or
# - Passing the keyword argument as the last hash parameter is deprecated, or
# - Splitting the last argument into positional and keyword parameters is deprecated
#
# https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/

Warning[:deprecated] = true

# -------------------------

def f1(key:)
end

f1({key: 42})
#=> warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call

f1(**{key: 42})
#=> OK

# -------------------------

def f2(x, key:)
end

# f2(key: 42)
#=> warning: Passing the keyword argument as the last hash parameter is deprecated
#=> `f2': missing keyword: :key (ArgumentError)

# -------------------------

def f3(x, **key)
end

f3(key: 42)
#=> warning: Passing the keyword argument as the last hash parameter is deprecated

f3({key: 42})
#=> OK

# -------------------------

def f4(hash = {})
end

f4(key: 42)
#=> OK

# -------------------------

def f5(hash = {}, **nil)
end

f5(key: 42)
#=> no keywords accepted (ArgumentError)
