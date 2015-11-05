require 'spec_helper'

describe SpyFu::Requests::UrlApi do
  subject { SpyFu::Requests::UrlApi }

  describe '#organic_kws' do
    it 'fails without q or r' do
      expect { subject.organic_kws({}) }.to raise_error SpyFu::Errors::MissingRequireParameters
    end

    it 'calls SypFu::Request' do
      expect(SpyFu::Request).to receive(:new).with('/apis/url_api/organic_kws', [:q, :r], {})
                                  .and_return(double(send_request: ''))
      subject.organic_kws({})
    end
  end

  describe '#paid_kws' do
    it 'fails without q or r' do
      expect { subject.paid_kws({}) }.to raise_error SpyFu::Errors::MissingRequireParameters
    end

    it 'calls SypFu::Request' do
      expect(SpyFu::Request).to receive(:new).with('/apis/url_api/paid_kws', [:q, :r], {})
                                  .and_return(double(send_request: ''))
      subject.paid_kws({})
    end
  end
end
