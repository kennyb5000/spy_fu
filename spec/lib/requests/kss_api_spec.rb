require 'spec_helper'

describe SpyFu::Requests::KssApi do
  subject { SpyFu::Requests::KssApi }

  describe '#kss_kws' do
    it 'fails without q or r' do
      expect { subject.kss_kws({}) }.to raise_error SpyFu::Errors::MissingRequireParameters
    end

    it 'calls SypFu::Request' do
      expect(SpyFu::Request).to receive(:new).with('/apis/kss_api/kss_kws', [:q, :r], {})
                                  .and_return(double(send_request: ''))
      subject.kss_kws({})
    end
  end
end
