module NumToWordMapper

  class WordDictionary

    FILE_PATH = File.join(File.dirname(__FILE__), '../../data/dictionary.txt')

    class << self

      # Fetch the word and Store it as hash, hash key will be the equivalent number of that word
      # As more than one word can have same key, So stored word equivalent number as it's key and it's value will be all the equivalent word in the dictionary  
      def words
        {}.tap do |word|
          File.read(FILE_PATH).each_line do |line|
            line = line.strip.downcase
            if line.length >= 3 && line.length < 11
              eq_number = convert_letter_to_number(line)
              word[eq_number] = [] if word[eq_number].nil? || word[eq_number].empty?
              word[eq_number].push(line)
            end
          end
        end
      end

      # convert the dictionary letter to it's equivalent number
      def convert_letter_to_number(line)
        line.tr('abcdefghijklmnopqrstuvwxyz', '22233344455566677778889999')
      end

    end

  end

end
