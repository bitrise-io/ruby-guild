# The default visibility for all methods is public

class V1
  def public1; end

  # You can define visibility for the following methods
  private

  def private1; end
  def private2; end
end

V1.new.public1
begin
  V1.new.private2
rescue NoMethodError => ex
  p ex
  # => #<NoMethodError: private method `private2' called for #<V1:0x00007ff9978d1538>>
end


class V2
  def public1; end
  # You can define visibility inline with the method definition
  private def private1; end
  def private2; end
end

V2.new.public1
begin
  V2.new.private1
rescue NoMethodError => ex
  p ex
  # => #<NoMethodError: private method `private1' called for #<V2:0x00007fd785070aa8> Did you mean?  private2>
end
V2.new.private2


class Receiver
  def public_message
    private_message
  end
  def self_public_message
    self.private_message
  end
  private
  def private_message
    puts "This is a private message"
  end
end

# The levels public / protected / private have their quirks (beyond today's scope) but they mostly work the same
# as they do in other languages. As a practical tip, you almost never want/need to use protected.
