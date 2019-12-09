# frozen_string_literal: true

require_relative '../actions/action'
require_relative '../actions/event'
require_relative '../basic/condition'
require_relative '../basic/effect'

class Hash
  def to_symbol_hash
    map { |k, v| [k.to_sym, v] }.to_h
  end
end

class ActionConfig
  attr_accessor :config

  def initialize(config)
    self.config = config
  end

  def actions
    config['actions'].map do |name, config|
      action_name = config.fetch 'name', name
      events = events_from_config config.fetch 'events'
      conditions = conditions_from_config config.fetch 'conditions', []
      Action.new(name: action_name, events: events, conditions: conditions)
    end
  end

  def events_from_config(config)
    config.map do |event|
      effect = effect_from_config event.fetch 'effect'
      conditions = conditions_from_config event.fetch 'conditions', []
      Event.new(effect: effect, conditions: conditions)
    end
  end

  def effect_from_config(config)
    e = config.to_symbol_hash
    Effect.new e
  end

  def conditions_from_config(config)
    config.map(&:to_symbol_hash)
          .map { |cond| Condition.new(cond) }
  end
end
