class Event
  attr_accessor :conditions, :effect

  def initialize(effect:, conditions: [])
    self.effect = effect
    self.conditions = conditions
  end

  def valid?(valera)
    conditions.all? { |c| c.valid?(valera) }
  end

  def apply(valera)
    effect.apply valera if valid? valera
  end
end