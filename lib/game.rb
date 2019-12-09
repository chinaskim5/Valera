# frozen_string_literal: true

require_relative '../lib/valera'
require_relative '../lib/states/load_configs'
require 'yaml'

class Game
  def run
    state = GameStates::LoadConfigs.new

    loop do
      state.render
      state = state.next
    end
  end
end
