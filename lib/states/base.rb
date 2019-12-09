module GameStates
  class Base
    attr_reader :context

    def initialize(context = {})
      @context = context
    end
  end
end

# load actions (?, 0) -> check valera status (1) -> render + input actions (2) -> run action (3) -> save valera (4) -> 1