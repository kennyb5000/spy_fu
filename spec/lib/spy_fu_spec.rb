require 'spec_helper'

describe 'SpyFu' do
  describe 'configuration' do
    it { expect(SpyFu.configuration.is_a?(SpyFu::Configuration)).to eq(true) }
  end

  describe 'configure' do
    it 'sets the configuration' do
      expect(SpyFu.configuration.secret_key).to eq 'secret_key'
      SpyFu.configure do |config|
        config.secret_key = 'foo'
      end

      expect(SpyFu.configuration.secret_key).to eq 'foo'
    end
  end

  it 'has a version number' do
    expect(SpyFu::VERSION).not_to be nil
  end
end
