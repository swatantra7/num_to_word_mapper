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
    describe '#to_words' do
    end
  end

end
