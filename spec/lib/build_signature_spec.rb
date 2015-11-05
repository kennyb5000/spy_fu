require 'spec_helper'

describe SpyFu::BuildSignature do
  subject { SpyFu::BuildSignature }

  it 'encodes and hashes the message' do
    expect(subject.new('test', 'secret_key').call).to eq 'PDhXSLnClg0SlEz1XlvJQG9bp5wrlClxqJyJDAsfOmE='
  end

  it 'fail without a key' do
    expect { subject.new('test', nil).call }.to raise_error SpyFu::Errors::MissingSecretKey
  end
end
