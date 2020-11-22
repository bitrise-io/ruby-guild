# It's easy to design and implement a DSL in Ruby around a certain problem

file :items do
  filename 'items_*.csv'
  field :rownum
  field :item_id
  field :item_name
end

file :unique_items do
  field :item_id
  field :item_name
end

deduplicate :items, into: :unique_items, using_field: :item_id




# For example like this:

$file_definitions = {}

def file(name, &block)
  $file_definitions[name] = FileScope.new.instance_exec &block
end

class FileScope
  attr_reader :pattern, :fields

  def initialize
    @fields = []
  end

  def filename(pattern)
    @pattern = pattern
  end

  def field(field_name)
    @fields << field_name
  end
end

def deduplicate(file, into:, using_field:)
  # ...
end
