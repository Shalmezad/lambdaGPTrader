class Program < ApplicationRecord

  # Runs the program and returns the position (true = buy/in, false = sell/out)
  def get_position(time)
    json = JSON.parse(self.gene)
    evaluate_component(json)
  end

  def evaluate_component(json_component)
    # What are we looking at?
    if json_component.is_a?(Hash)
      evaluate_hash(json_component)
    elsif json_component.is_a?(Array)
      evaluate_array(json_component)
    elsif json_component.is_a?(TrueClass) || json_component.is_a?(FalseClass)
      return json_component
    else
      raise "Cannot evaluate unknown component: #{json_component.inspect}"
    end
  end

  def evaluate_array(json_component)
    # If it's an array, it's fine if there's only 1 thing:
    if json_component.size == 1
      return evaluate_component(json_component[0])
    else
      raise "Cannot evaluate an array with length > 0: #{json_component.inspect}"
    end
  end

  def evaluate_hash(json_component)
    # There should only be one key/value:
    if json_component.keys.size == 1
      key = json_component.keys.first
      value = json_component[key]
      # Ok we need to see what the key is:
      if key == "or"
        return evaluate_or(value)
      else
        raise "Unknown function '#{key}': #{json_component.inspect}"
      end
    else
      raise "Cannot evaluate a hash with more than one key: #{json_component.inspect}"
    end
  end

  def evaluate_or(params)
    # params should be an array with exactly 2 elements:
    if !params.is_a?(Array)
      raise "parameters of 'or' must be an array: #{sides}"
    end
    if params.size != 2
      raise "parameters of 'or' must contain exactly 2 elements: #{sides}"
    end
    return (evaluate_component(params[0]) or evaluate_component(params[1]))
  end

end
