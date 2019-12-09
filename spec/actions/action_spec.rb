# frozen_string_literal: true

require_relative '../spec_helper'

describe Action do
  subject(:action) do
    cond1 = Condition.new(field: 'health', operator: '<', value: 50)
    cond2 = Condition.new(field: 'mana', operator: '==', value: 50)
    cond3 = Condition.new(field: 'money', operator: '>', value: 50)

    effect1 = Effect.new(field: 'health', operator: '+', value: 30)

    event1 = Event.new(effect: effect1)

    Action.new(name: 'test', events: [event1], conditions: [cond1, cond2, cond3])
  end

  subject(:valera) do
    Valera.new(health: 30, mana: 50, money: 70)
  end

  subject(:invalid_valera) do
    Valera.new(health: 30, mana: 50, money: 30)
  end

  describe '#valid?' do
    context 'invalid VALERA with inappropriate stats' do
      it { expect(action.valid?(invalid_valera)).to be false }
    end

    context 'valid VALERA with appropriate stats' do
      it { expect(action.valid?(valera)).to be true }
    end
  end

  describe '#run' do
    context "Increase Valera's health" do
      it { expect { action.run(valera) }.to change(valera, :health).to(60) }
    end
    context "Shouldn't change because of #valid?" do
      it { expect { action.run(invalid_valera) }.to_not change(valera, :health).from(30) }
    end
  end
end
