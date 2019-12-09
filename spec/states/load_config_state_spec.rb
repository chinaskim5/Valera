# frozen_string_literal: true

require_relative '../spec_helper'

describe GameStates::LoadConfigs do
  describe '#load' do
    context 'check loading state from Config' do
      it 'load states from file' do
        expect(ConfigAdapter.instance.load 'spec/config/test_config.yml').not_to be nil
      end
    end
  end
end
