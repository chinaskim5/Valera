
describe Valera do
  subject(:valid_valera) do
    Valera.new
  end
  describe "#dead?" do
    let(:invalid_valera) { Valera.new(health: 0) }
    context "Checking that Valera is dead" do
      it { expect(invalid_valera.dead?).to be true }
      it { expect(valid_valera.dead?).to be false}
    end
  end
  describe "#health=" do
    context "range of health attr = [0, 100]" do
      it "valid value" do
        valid_valera.health = 50
        expect(valid_valera.health).to eq 50
      end
      it "more than upper bound" do
        valid_valera.health = 110
        expect(valid_valera.health).to eq 100
      end
      it "less than lower bound" do
        valid_valera.health = -10
        expect(valid_valera.health).to eq 0
      end
    end
  end
  describe "#mana=" do
    context "range of mana attr = [0, 100]" do
      it "valid value" do
        valid_valera.mana = 50
        expect(valid_valera.mana).to eq 50
      end
      it "more than upper bound" do
        valid_valera.mana = 110
        expect(valid_valera.mana).to eq 100
      end
      it "less than lower bound" do
        valid_valera.mana = -10
        expect(valid_valera.mana).to eq 0
      end
    end
  end
  describe "#fun=" do
    context "range of fun attr = [-10, 10]" do
      it "valid value" do
        valid_valera.fun = 5
        expect(valid_valera.fun).to eq 5
      end
      it "more than upper bound" do
        valid_valera.fun = 20
        expect(valid_valera.fun).to eq 10
      end
      it "less than lower bound" do
        valid_valera.fun = -20
        expect(valid_valera.fun).to eq -10
      end
    end
  end
  describe "#fatigue=" do
    context "range of fatigue = [0, 100]" do
      it "valid value" do
        valid_valera.fatigue = 50
        expect(valid_valera.fatigue).to eq 50
      end
      it "more than upper bound" do
        valid_valera.fatigue = 110
        expect(valid_valera.fatigue).to eq 100
      end
      it "less than lower bound" do
        valid_valera.fatigue = -10
        expect(valid_valera.fatigue).to eq 0
      end
    end
  end
end