# frozen_string_literal: true

require_relative './save_player'

module GameStates
  class SelectAction < Base
    def render
      puts 'Select an action:'
      context[:actions].each_with_index { |action, id| puts "#{id + 1}) #{action.name}" }
      puts "#{context[:actions].length + 1}) Quit the game"
    end

    def next
      action_id = gets.to_i - 1
      case action_id
      when 0...context[:actions].length
        context[:actions][action_id].run context[:valera]
        SavePlayer.new context
      when context[:actions].length
        LeaveGame.new
      else
        puts 'Invalid action!'
        self
      end
    end
  end
end
