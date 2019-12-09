# frozen_string_literal: true

require "rspec"
require_relative "../spec_helper"

describe GameStates::PlayerDeath do
  subject do
    GameStates::PlayerDeath.new
  end
  describe "#render" do
    context "render?" do
      it { expect{ subject.render}.to output("1) Reset player\n2) Quit the game\n").to_stdout }
    end
    context "#next" do

    end
  end
end
