# frozen_string_literal: true

require_relative './base'
require_relative './select_action'
require_relative './player_death'

module GameStates
  class PlayerState < Base
    def render
      if valera_is_dead?
        puts "Valera is dead :("
      else
        valera = context[:valera]
        puts "Valera params: Health [#{valera.health}]
              Mana [#{valera.mana}] Fun [#{valera.fun}]
              Fatigue [#{valera.fatigue}] Money [#{valera.money}]"
      end
    end

    def next
      if !valera_is_dead?
        SelectAction.new context
      else
        PlayerDeath.new context
      end
    end

    def valera_is_dead?
      !context[:valera] || context[:valera].dead?
    end
  end
end
