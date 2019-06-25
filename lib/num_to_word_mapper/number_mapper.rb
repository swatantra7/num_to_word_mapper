module NumToWordMapper

  class NumberMapper

    attr_reader :number

    def initialize(num)
      @number = num
    end

    def to_words
      return wrong_input_msg unless is_valid?
    end

    private

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
    
  end

end