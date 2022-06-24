require_relative 'association'
require_relative 'reflection'

class ApplicationRecord
  # Class-specific implementation
  def self.belongs_to(name)
    def repository
      Repository.where(id: repository_id).first
    end

    def repository=(repository)
      self.repository_id = repository.id
    end
  end

  # Generic implementation without caching
  def self.belongs_to(name)
    reflection = Reflection.new(name, self)
    klass = reflection.klass
    primary_key = reflection.primary_key
    foreign_key = reflection.foreign_key

    define_method(name) do
      klass.where(primary_key => foreign_key).first
    end

    define_method("#{name}=") do |record|
      self[foreign_key] = record[primary_key]
    end
  end

  def self.belongs_to(name)
    define_method(name) do
      association(name).reader
    end

    define_method("#{name}=") do |record|
      association(name).writer(record)
    end
  end

  def self.has_many(name)
    define_method(name) do
      association(name).reader
    end

    define_method("#{name}=") do |record|
      association(name).writer(record)
    end
  end

  def association(name)
    @associations[name] ||= begin
                              # In reality, we're instantiating different kind of associations, based on the
                              # reflection class (e.g. BelongsToAssociation or HasManyAssociation)
                              reflection = Reflection.new(name, self)
                              Association.new(self, reflection)
                            end
  end

  def self.primary_key
    :id
  end
end
