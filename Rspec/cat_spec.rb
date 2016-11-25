describe Cat do
  subject(:cat) { Cat.new }

  context 'when breed was set' do
    let(:breed){"British Shorthair"}
    it { expect(cat).to be_fluffy }
  end

  context 'when breed was not set' do
    it "raise error" do
      expect { cat.fluffy? }.to raise_error
    end
  end

  context 'when breed is not a Sphynx' do
    let(:breed){"British Shorthair"}
    it { expect(cat).to be_fluffy }
  end

  context 'when breed is a Sphynx' do
    let(:breed){"Sphynx"}
    it { expect(cat).not_to be_fluffy }
  end

  context 'eat when hungry' do
    let(:hungry){true}
    it "eat" do
      expect {cat.eat}
      .to change(cat, :hungry).from(false).to(true)
    end
  end

  context 'eat when fed' do
    let(:hungry){false}
    it "eat" do
      expect {cat.eat}.to raise_error("I am not hungry")  
    end
  end
end
