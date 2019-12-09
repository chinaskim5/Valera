# frozen_string_literal: true

require_relative './base'

module GameStates
  class LeaveGame < Base
    def render
      puts 'Ещё увидимся...'
    end

    def next
      exit(true)
    end
  end
end
