require 'spec_helper'

describe SpyFu::Request do
  subject { SpyFu::Request }

  describe '#send_request' do
    it 'fails if missing required parameters' do
      expect do
        subject.new('/foo/bar', %i(test), {}).send_request
      end.to raise_error SpyFu::Errors::MissingRequireParameters
    end

    it 'calls BuildRequest and Response' do
      expect_any_instance_of(SpyFu::BuildRequest).to receive(:build_request)
      expect(SpyFu::Response).to receive(:new).and_return(double call: '')
      subject.new('/foo/bar', %i(), {}).send_request
    end
  end
end
