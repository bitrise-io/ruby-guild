# Ruby supports passing arguments by name, rather than positionally - these are called keyword arguments

def split(string:, by: ' ')
  # ...
end

split string: 'some_string', by: '_'

# You can achieve the same syntax by using hash arguments but this yields a cleaner implementation in the function
