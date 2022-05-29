# You can refer to block parameters by their number, instead of naming them

{a: 1, b: 2}.each { |key, value| p key, value }
# this can now be written as:
{a: 1, b: 2}.each { p _1, _2 }
