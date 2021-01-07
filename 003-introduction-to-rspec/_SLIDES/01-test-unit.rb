# run this file with bundle exec ruby 01-test-unit.rb

# Test/Unit is built into Ruby itself, the minimalist testing framework

# - Used to be part of the stdlib, came with Ruby installed then for maintainability reasons it has been extracted out into a gem
# - Does not intend to cover the concept test definition structures, reporters, etc
# - Not exactly readable
# ... but it is there if you need it.

require "test/unit/assertions"
include Test::Unit::Assertions

hello = 'world'
assert_equal 'world', hello, "hello function should return 'world'"

wearing_a_mask = false
assert_true wearing_a_mask, 'wearing_a_mask should be true'

# Further assertations include:
# - assert_not_empty
# - assert_instance_of
# - assert_false
# - assert_raise_kind_of
