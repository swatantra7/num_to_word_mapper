module NumToWordMapper

  class NumberMapper

    COMBINATIONS = { combination1: [3,7], combination2: [3,3,4], combination3: [3,4,3], combination4: [4,6], combination5: [4,3,3], combination6: [5,5], combination7: [6,4], combination8: [7,3]}

    attr_reader :number

    def initialize(num)
      @number = num
    end

    def to_words
      return wrong_input_msg unless is_valid?
      number1 = number.digits.reverse
      word_combinations = {}.tap do |combinations|
        COMBINATIONS.values.each_with_index do |val, index|
          if val.count > 2
            first_limit = val[0]
            arr1 = number1[0..(first_limit-1)].join('')
            matched_key1 =  dictionary.values_at(arr1).compact
            unless matched_key1.empty?
              arr2 = number1[first_limit..(first_limit+val[1]-1)].join('')
              matched_key2 = dictionary.values_at(arr2).compact
              arr3 = number1[(first_limit+val[1])..number1.length].join('') unless matched_key2.empty?
              matched_key3 = dictionary.values_at(arr3).compact
              unless matched_key3.empty?
                combinations[index] = matched_key1 | matched_key2 | matched_key3
              end
            end
          else
            first_limit = val[0]
            arr1 = number1[0..(first_limit-1)].join('')
            matched_key1 =  dictionary.values_at(arr1).compact
            unless matched_key1.empty?
              arr2 = number1[first_limit..number1.length].join('')
              matched_key2 = dictionary.values_at(arr2).compact
              unless matched_key2.empty?
                combinations[index] = matched_key1 | matched_key2
              end
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

    # find data from dictionary length as a key
    def dictionary
      @dictionary_data  = @dictionary_data ||  NumToWordMapper::WordDictionary.words
    end

  end

end
