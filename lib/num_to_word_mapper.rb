require "num_to_word_mapper/version"

Dir[File.join(File.dirname(__FILE__), '**/*.*')].each { |f| require f }

module NumToWordMapper
  class Error < StandardError; end
  # Your code goes here...
end
