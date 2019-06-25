require "bundler/setup"
require "num_to_word_mapper"
require 'rspec-benchmark'

RSpec.configure do |config|

  # Included Rpsec Bechmark
  config.include RSpec::Benchmark::Matchers
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
