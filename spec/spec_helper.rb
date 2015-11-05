require 'bundler/setup'
Bundler.setup

require 'spy_fu'


# Webmock
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

SpyFu.configure do |c|
  c.secret_key = 'secret_key'
  c.user_id = 'user_id'
end

RSpec.configure do |config|
  config.before :each do
    stub_request(:get, /spyfu/).to_return(status: 200, body: '{}')
  end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
