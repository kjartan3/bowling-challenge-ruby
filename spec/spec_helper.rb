# spec_helper.rb

require_relative '../lib/class'

# Configure RSpec
RSpec.configure do |config|
  # Set the formatter to documentation
  config.formatter = :documentation

  # Set the default expectation syntax to `expect`
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  # Set the default mocking syntax to `verify_partial_doubles`
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Use the built-in `focus` tag to selectively run a single test or a group of tests
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Configure RSpec to automatically include any helper modules in the `spec/support` directory
  Dir[File.join(__dir__, 'support', '**', '*.rb')].sort.each { |f| require f }

  # Add any other global configurations or setup that you need for your tests
end
