module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      name_attr = "@#{name}".to_sym
      name_attr_history = "@#{name}_history".to_sym

      define_method(name) do
        instance_variable_get(name_attr)
      end

      define_method("#{name_attr}_history") do
        instance_variable_get(name_attr_history).to_a
      end

      define_method("#{name}=".to_sym) do |value|
        prev_values = send("#{name}_history")
        prev_values << instance_variable_get(name_attr)
        instance_variable_set(name_attr_history, prev_values)
        instance_variable_set(name_attr, value)
      end
    end
  end

  def attr_accessor_strong(name, classname)
    name_attr = "@#{name}".to_sym

    define_method(name) do
      instance_variable_get(name_attr)
    end

    define_method("#{name}=".to_sym) do |value|
      raise TypeError, "Value is not #{classname}" unless value.is_a?(classname)

      instance_variable_set(name_attr, value)
    end
  end
end
