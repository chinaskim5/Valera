# frozen_string_literal: true

require_relative './base'
require_relative './reset_player'
require_relative './leave_game'

module GameStates
  class PlayerDeath < Base
    def render
      puts "1) Reset player"
      puts "2) Quit the game"
    end

    def next
      case gets.to_i
      when 1
        ResetPlayer.new context
      when 2
        LeaveGame.new
      else
        puts 'Invalid menu item!'
        self
      end
    end
  end
end
