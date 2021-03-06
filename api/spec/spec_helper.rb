RSpec.configure do |config|
  config.before(:each, type: :request) do
    # Bah
    host! "localhost"
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.color = true
  config.formatter = :documentation
  config.order = 'default'

  Kernel.srand config.seed
end
