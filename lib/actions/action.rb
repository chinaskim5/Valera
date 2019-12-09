class Action
  attr_accessor :name, :conditions, :events

  def initialize(name:, events:, conditions: [])
    self.name = name
    self.events = events
    self.conditions = conditions
  end

  def valid?(valera)
    conditions.all? { |c| c.valid?(valera) }
  end

  def run(valera)
    events.each { |e| e.apply valera } if valid? valera
  end
end