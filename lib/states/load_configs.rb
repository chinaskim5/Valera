# frozen_string_literal: true

require_relative './base'
require_relative './player_state'
require_relative '../configs/config_adapter'
require_relative '../configs/action_config'

module GameStates
  class LoadConfigs < Base
    def render
      puts "Load actions..."
    end

    def next
      valera = ConfigAdapter.instance.load 'configs/saved_states.yml'
      actions = ActionConfig.new(ConfigAdapter.instance.load('configs/actions.yml')).actions
      PlayerState.new context.merge(valera: valera, actions: actions)
    end
  end
end
