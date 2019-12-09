require 'minitest/autorun'

describe GameStates::ResetPlayer do
  subject do
    valera = Valera.new(health: 30, mana: 50, money: 70)
    GameStates::ResetPlayer.new valera: valera
  end
  describe '#next' do
    context 'when condition' do
      let(:default_valera) { Valera.new }
      it 'succeeds' do
        state = subject.next
        context_valera = state.context[:valera]
        expect(state.is_a? GameStates::SavePlayer).to be true
        expect(default_valera.health == context_valera.health).to be true
        expect(default_valera.mana == context_valera.mana).to be true
        expect(default_valera.fatigue == context_valera.fatigue).to be true
        expect(default_valera.fun == context_valera.fun).to be true
        expect(default_valera.money == context_valera.money).to be true
      end
    end
  end
end