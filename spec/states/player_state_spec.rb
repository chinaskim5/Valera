# frozen_string_literal: true

require 'rspec'
require_relative '../spec_helper'

describe GameStates::PlayerState do
  describe '#valera_is_dead?' do
    context 'checking of alive Valera' do
      let(:sub) { GameStates::PlayerState.new }
      it { expect(sub.valera_is_dead?).to be true }
    end
    context 'checking of dead Valera' do
      let(:val) { Valera.new(health: 0) }
      let(:sub) { GameStates::PlayerState.new(valera: val) }
      it { expect(sub.valera_is_dead?).to be true }
    end
  end
end
