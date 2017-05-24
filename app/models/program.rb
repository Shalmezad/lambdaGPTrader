class Program < ApplicationRecord

  # Runs the program and returns the position (true = buy/in, false = sell/out)
  def get_position(time)
    json = JSON.parse(self.gene)
    evaluate_component(json)
  end

  def evaluate_component(json_component)
    # What are we looking at?
    if json_component.is_a?(Hash)
      # Ok we need to see what the key is:
    elsif json_component.is_a?(Array)
      # If it's an array, it's fine if there's only 1 thing:
      if json_component.size == 1
        return json_component[0]
      else
        raise "Cannot evaluate an array with length > 0: #{json_component.inspect}"
      end
    else
      raise "Cannot evaluate unknown component: #{json_component.inspect}"
    end
  end
end
