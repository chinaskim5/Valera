# frozen_string_literal: true

require_relative '../error/valera_error'

class Condition
  attr_accessor :field, :operator, :value

  def initialize(field:, operator:, value:)
    case operator
    when '<', '>', '>=', '<=', '==', '!='
      self.field = field
      self.operator = operator
      self.value = value
    else
      raise ValeraError.new('Condition'), "Invalid operator: '#{operator}'! Available operators: '<', '>', '>=', '<=', '==', '!='"
    end
  end

  def valid?(valera)
    unless valera.respond_to?(field)
      raise ValeraError.new('Condition'), "Invalid field: '#{field}'! Available fields: #{valera.instance_variables}"
    end

    actual_value = valera.send field
    actual_value.send operator, value
  end
end
