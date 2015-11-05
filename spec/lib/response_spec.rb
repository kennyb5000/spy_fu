require 'spec_helper'

describe SpyFu::Response do
  subject { SpyFu::Response }

  describe '#call' do
    it 'fails if not 200' do
      response = double code: 401, body: '"This is my error"'
      expect { subject.new(response).call }.to raise_error SpyFu::Errors::Error, ' : This is my error'
    end

    it 'return self if success' do
      response = double code: 200, body: '"This is my error"'
      expect(subject.new(response).call.is_a?(SpyFu::Response)).to eq true
    end
  end
end
