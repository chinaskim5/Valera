# frozen_string_literal: true

require_relative '../spec_helper'

describe Condition do
  describe '#initialize' do
    context 'check validation of operators' do
      it { expect { Condition.new(field: 'mana', operator: 0, value: 0) }.to raise_error(ValeraError) }
    end
  end
  describe '#valid?' do
    let(:valera) { Valera.new(mana: 50) }
    let(:condition_equal_50) { Condition.new(field: 'mana', operator: '==', value: 50) }
    let(:condition_bigger_50) { Condition.new(field: 'mana', operator: '>', value: 50) }
    context "validation of Valera's mana" do
      it { expect(condition_equal_50.valid?(valera)).to be true }
      it { expect(condition_bigger_50.valid?(valera)).to be false }
    end
  end
end
