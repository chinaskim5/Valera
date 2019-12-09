# frozen_string_literal: true

require 'yaml'

class Valera
  attr_reader :health, :mana, :fun, :fatigue
  attr_accessor :money

  def initialize(health: 100, mana: 0, fun: 0, fatigue: 0, money: 0)
    @health = health
    @mana = mana
    @fun = fun
    @fatigue = fatigue
    @money = money
  end

  def dead?
    health == 0
  end

  def health=(health)
    @health = validate(health, 0, 100)
  end

  def mana=(mana)
    @mana = validate(mana, 0, 100)
  end

  def fun=(fun)
    @fun = validate(fun, -10, 10)
  end

  def fatigue=(fatigue)
    @fatigue = validate(fatigue, 0, 100)
  end

  private def validate(value, min, max)
    [[value, max].min, min].max
  end
end
