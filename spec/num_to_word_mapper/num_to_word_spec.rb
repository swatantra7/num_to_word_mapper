RSpec.describe NumToWordMapper do

  it "has a version number" do
    expect(NumToWordMapper::VERSION).not_to be nil
  end

  describe 'Validations' do
    describe '#number' do
      it 'Should not accept 123456' do
        expect(
          123456.to_words
        ).to eq 'Please Enter 10 Number'
      end

      it 'Should not accept 1 and 0' do
        expect(
          1234567890.to_words
        ).to eq 'Please Enter Number Except O and 1'
      end
    end
  end

  describe 'Instance Methods' do
    describe '#words' do
      it 'Except Result For 6686787825' do
        expect(
          6686787825.to_words
        ).to match_array([['motor', 'usual'], ['noun', 'struck'], ['nouns', 'truck'], ['nouns', 'usual'], ['onto', 'struck'], 'motortruck'])
      end

      it 'should take time less than 1000 ms' do
        expect {
          6686787825.to_words
        }.to perform_under(1000).ms
      end
    end
  end

end
