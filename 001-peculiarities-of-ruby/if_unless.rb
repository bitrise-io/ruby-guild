# "If" has a negated form in "unless"

if 1 == 1
  2
elsif 2 == 2
  3
else
  4
end

# This is possible but not recommended because of the double negative logic behind unless-else
unless 1 == 1
  1
else
  2
end

# Both constructs have an inline form as well
a = 1 if 1 == 1
return 2 unless 2 == 2
