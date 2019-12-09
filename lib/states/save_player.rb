# frozen_string_literal: true

require_relative "./base"
require_relative "./select_action"
require_relative "../configs/config_adapter"

module GameStates
  class SavePlayer < Base
    def render

    end

    def next
      ConfigAdapter.instance.save "configs/saved_states.yml", context[:valera]
      PlayerState.new context
    end
  end
end
