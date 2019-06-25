module NumToWordMapper

  class NumberMapper

    attr_reader :number

    def initialize(num)
      @number = num
    end

    # fetch combinatio of each words using cross product and match combination with dictionary.
    def to_words
      return wrong_input_msg unless is_valid?
      word_combinations = {}.tap do |combinations|
        (1..9).each do |k|
          word_array_1 = find_corresponding_letter[0..k]
          word_array_2 = find_corresponding_letter[(k + 1)..9]
          unless word_array_1.empty? || word_array_2.empty?
            word_combination_1 = word_array_1[0].product(*word_array_1[1..word_array_1.length]).map(&:join)
            word_combination_2 = word_array_2[0].product(*word_array_2[1..word_array_2.length]).map(&:join)
            unless word_combination_1.nil? || word_combination_2.nil?
              # find common words between combination of words & words from dictionary
              combinations[k] = [(word_combination_1 & (dictionary[k + 1] || [])), (word_combination_2 & (dictionary[9 - k] || []))]
            end
          end
        end
      end
      fetch_final_combination(word_combinations)
    end

    private

    # will combine and select the word from dictionary

    def fetch_final_combination(word_combinations)
      [].tap do |words|
        word_combinations.values.each do |values|
          values[0].product(values[1]).each do |value|
            words << value
          end
        end
        words.map!{ |words| [([words.join('')] & dictionary[10]).first, words].compact.first }
      end
    end

    # Validate the Input Number
    def is_valid?
      number.is_a?(Integer) &&
      number.positive? &&
      number.to_s.length == 10 &&
      !number.to_s.include?("0") && !number.to_s.include?("1")
    end

    # Error Message For Invalid Number
    def wrong_input_msg
      number_in_string = number.to_s
      if number_in_string.length < 10
        "Please Enter 10 Number"
      elsif
        number_in_string.include?("0") || number_in_string.include?("1")
        "Please Enter Number Except O and 1"
      else
        "Please Enter Valid Number"
      end
    end

    # find mapped alphabets with respect to letter
    def find_corresponding_letter
      @letter = @letter || number.to_s.split('').map{ |digit| NumToWordMapper::MappedNumber::NUM_TO_WORD[digit.to_i] }
    end

    # find data from dictionary length as a key
    def dictionary
      @dictionary_data  = @dictionary_data ||  NumToWordMapper::WordDictionary.words
    end
    
  end

end