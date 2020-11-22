# Old syntax (hash rocket) - deprecated

{
  'string_key' => 'value',
  :symbol_key => 'value'
}

# New syntax

{
  'string_key' => 'value',
  symbol_key: 'value'
}


# Syntax rule: if the last parameter of a function is a hash, then the curly braces can be omitted

split('some string', {'into' => 2})

split 'some string', into: 2
