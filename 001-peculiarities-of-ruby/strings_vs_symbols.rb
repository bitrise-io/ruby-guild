p 'value' == "value"
# => true

p 'value' == :value
# => false

p :value == :value
# => true

p 'value'.equal? 'value'
# => false

p :value.equal? :value
# => true

# Two strings can be equal, but not the same object if their contents are equal.
# Two symbols, however, are always the same object if their contents are equal.
