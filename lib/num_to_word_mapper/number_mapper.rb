module NumToWordMapper

  class NumberMapper

    # Possible Combinations of Number

    COMBINATIONS = { combination1: [3,7], combination2: [3,3,4], combination3: [3,4,3], combination4: [4,6], combination5: [4,3,3], combination6: [5,5], combination7: [6,4], combination8: [7,3], combination9: [10]}

    attr_reader :number

    def initialize(num)
      @number = num
    end

    # Split the  Number and find all the matching values in dictionary from the key as number and select the all matching words as array
    def to_words
      return wrong_input_msg unless is_valid?
      number1 = number.digits.reverse
      word_combinations = {}.tap do |combinations|
        COMBINATIONS.values.each_with_index do |val, index|
          matched_key = []
          prev_index = 0
          prev_lower_limit = 0
          val.each_with_index do |val, index|
            lower_limit = index.zero? ? index : prev_lower_limit
            upper_limit = index.zero? ? val-1 : (index== 2 ? 9 : prev_index+val)
            string_to_match = number1[lower_limit..upper_limit].join('')
            prev_index = val-1
            prev_lower_limit += val
            matched_partition_in_dictionary = dictionary.values_at(string_to_match).flatten.compact
            matched_key = [] if matched_partition_in_dictionary.empty?
            break if matched_partition_in_dictionary.empty?
            matched_key <<  matched_partition_in_dictionary
          end
          combinations[index] = matched_key unless matched_key.flatten.empty?  
        end
      end
      fetch_final_combination(word_combinations)
    end

    private

    # will combine all the matched values from dictionary

    def fetch_final_combination(word_combinations)
      words = []
      word_combinations.values.each do |values|
        words += values[1..-1].inject(values[0]){ |m,v| m = m.product(v).map(&:flatten) } 
      end
      words
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

    # find data from dictionary length as a key
    def dictionary
      @dictionary_data  = @dictionary_data ||  NumToWordMapper::WordDictionary.words
    end

  end

end
