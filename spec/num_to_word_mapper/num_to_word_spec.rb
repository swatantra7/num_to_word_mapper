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
      it 'Except Result For 6686787825' do
        expect(
          6686787825.to_words
        ).to match_array([["mot", "opt", "puck"], ["mot", "opt", "ruck"], ["mot", "opt", "suck"], ["mot", "ort", "puck"], ["mot", "ort", "ruck"], ["mot", "ort", "suck"], ["not", "opt", "puck"], ["not", "opt", "ruck"], ["not", "opt", "suck"], ["not", "ort", "puck"], ["not", "ort", "ruck"], ["not", "ort", "suck"], ["oot", "opt", "puck"], ["oot", "opt", "ruck"], ["oot", "opt", "suck"], ["oot", "ort", "puck"], ["oot", "ort", "ruck"], ["oot", "ort", "suck"], ["mot", "opts", "taj"], ["mot", "opus", "taj"], ["mot", "orts", "taj"], ["not", "opts", "taj"], ["not", "opus", "taj"], ["not", "orts", "taj"], ["oot", "opts", "taj"], ["oot", "opus", "taj"], ["oot", "orts", "taj"], ["noun", "struck"], ["onto", "struck"], ["noun", "pup", "taj"], ["noun", "pur", "taj"], ["noun", "pus", "taj"], ["noun", "sup", "taj"], ["noun", "suq", "taj"], ["onto", "pup", "taj"], ["onto", "pur", "taj"], ["onto", "pus", "taj"], ["onto", "sup", "taj"], ["onto", "suq", "taj"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"])
      end

      it 'should take time less than 1000 ms' do
        expect {
          6686787825.to_words
        }.to perform_under(1000).ms
      end
    end
  end

end
