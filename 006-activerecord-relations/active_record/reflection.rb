class Reflection
  def initialize(name, active_record)
    # name: :repository
    # active_record: Build
    @name = name
    @active_record = active_record
  end

  def klass
    @name.to_s.camelize.constantize
  end

  def primary_key
    klass.primary_key
  end

  def foreign_key
    "#{@name}_id"
  end

  def inverse_name
    @active_record.name.underscore.to_sym
  end
end
