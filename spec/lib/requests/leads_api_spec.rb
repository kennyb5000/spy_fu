require 'spec_helper'

describe SpyFu::Requests::LeadsApi do
  subject { SpyFu::Requests::LeadsApi }

  describe '#get_contact_card' do
    it 'fails without domain' do
      expect { subject.get_contact_card({}) }.to raise_error SpyFu::Errors::MissingRequireParameters
    end

    it 'calls SypFu::Request' do
      expect(SpyFu::Request).to receive(:new).with('/apis/leads_api/get_contact_card', [:domain], {})
                                  .and_return(double(send_request: ''))
      subject.get_contact_card({})
    end
  end

  describe '#get_grid' do
    it 'calls SypFu::Request' do
      expect(SpyFu::Request).to receive(:new).with('/apis/leads_api/get_grid', [], {})
                                  .and_return(double(send_request: ''))
      subject.get_grid({})
    end
  end
end
