# frozen_string_literal: true

require_relative './base'
require_relative './player_state'

module GameStates
  class ResetPlayer < Base
    def render; end

    def next
      context[:valera] = Valera.new
      SavePlayer.new context
    end
  end
end
