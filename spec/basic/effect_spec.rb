# frozen_string_literal: true

require_relative '../spec_helper'

describe Effect do
  describe '#initialize' do
    context 'check validation of operators' do
      it { expect { Condition.new(field: 'mana', operator: 0, value: 0) }.to raise_error(ValeraError) }
    end
  end
end
