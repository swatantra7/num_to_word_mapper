module NumToWordMapper

  class WordDictionary

    FILE_PATH = File.join(File.dirname(__FILE__), '../../data/dictionary.txt')

    class << self

      # Fetch the word and Store it in length wise hash
      def words
        {}.tap do |word|
          File.open(FILE_PATH).each_line do |line|
            line = line.strip
            word[line.length] = [] if word[line.length].nil? || word[line.length].empty?
            word[line.length].push(line.downcase)
          end
        end
      end

    end

  end

end