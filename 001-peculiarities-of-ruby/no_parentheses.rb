# Parentheses are optional (except when required :) )

def say(b)
  'say ' + b
end

say('hello')

# You can do the same without any parentheses

def hello d
  'hello ' + d
end

hello 'to me'

# You can write sentences

p say hello 'to me'
# => "say hello to me"
