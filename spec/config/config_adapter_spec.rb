# frozen_string_literal: true

require_relative '../spec_helper'

describe ConfigAdapter do
  let(:file) { 'spec/config/test_config.yml' }
  subject do
    ConfigAdapter.instance
  end
  describe '#save' do
    context 'check saving of Config' do
      before { File.write('spec/config/test_config.yml', '') }
      let(:valera) { Valera.new(mana: 10, fun: 10, money: 10, fatigue: 10) }
      it 'save state in file' do
        subject.save(file, valera)
        expect(File.size?('spec/config/test_config.yml')).not_to be nil
      end
    end
  end

  describe '#load' do
    context 'check loading state from Config' do
      it 'load states from file' do
        expect(YAML.load_file('spec/config/test_config.yml')).not_to be nil
      end
    end
  end
end
