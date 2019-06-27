module NumToWordMapper

  class WordDictionary

    FILE_PATH = File.join(File.dirname(__FILE__), '../../data/dictionary.txt')

    class << self

      # Fetch the word and Store it as hash (key as it's equivalent number)
      def words
        {}.tap do |word|
          File.open(FILE_PATH).each_line do |line|
            line = line.strip.downcase
            if line.length >= 3 && line.length < 11
              eq_number = convert_letter_to_number(line)
              word[eq_number] = [] if word[line.length].nil? || word[line.length].empty?
              word[eq_number].push(line)
            end
          end
        end
      end

      # convert the dictionary letter to it's equivalent number
      def convert_letter_to_number(line)
        line.split('').map {|char| NumToWordMapper::MappedNumber::WORD_TO_NUM[char]}.join('')
      end

    end

  end

end