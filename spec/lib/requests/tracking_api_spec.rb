require 'spec_helper'

describe SpyFu::Requests::TrackingApi do
  subject { SpyFu::Requests::TrackingApi }

  describe '#add_terms' do
    it 'fails without groupName or domainName or isSeo or isPpc or keywordCsv' do
      expect { subject.add_terms({}, '') }.to raise_error SpyFu::Errors::MissingRequireParameters
    end

    it 'calls SypFu::Request' do
      expect(SpyFu::Request).to receive(:new).with('/apis/weeklytracking_api/add_terms',
                                                   %i(groupName domainName isSeo isPpc keywordCsv), {})
                                  .and_return(double(send_request: ''))
      subject.add_terms({}, '')
    end

    it 'converts keywords' do
      expect(SpyFu::Request).to receive(:new).with('/apis/weeklytracking_api/add_terms',
                                                   %i(groupName domainName isSeo isPpc keywordCsv),
                                                   keywordCsv: 'a2V5d29yZCwgb3RoZXI=')
                                  .and_return(double(send_request: ''))
      subject.add_terms({}, %w(keyword other))
    end
  end

  describe '#get_groups' do
    it 'calls SypFu::Request' do
      expect(SpyFu::Request).to receive(:new).with('/apis/weeklytracking_api/get_groups', [])
                                  .and_return(double(send_request: ''))
      subject.get_groups
    end
  end

  describe '#get_terms' do
    it 'fails without listId' do
      expect { subject.get_terms({}) }.to raise_error SpyFu::Errors::MissingRequireParameters
    end

    it 'calls SypFu::Request' do
      expect(SpyFu::Request).to receive(:new).with('/apis/weeklytracking_api/get_terms', [:listId], {})
                                  .and_return(double(send_request: ''))
      subject.get_terms({})
    end
  end

  describe '#get_term_data' do
    it 'fails without isSeo or domainId or termId' do
      expect { subject.get_term_data({}) }.to raise_error SpyFu::Errors::MissingRequireParameters
    end

    it 'calls SypFu::Request' do
      expect(SpyFu::Request).to receive(:new).with('/apis/weeklytracking_api/get_term_data',
                                                   [:isSeo, :domainId, :termId], {})
                                  .and_return(double(send_request: ''))
      subject.get_term_data({})
    end
  end

  describe '#delete_term' do
    it 'fails without listId or domainId or termId' do
      expect { subject.delete_term({}) }.to raise_error SpyFu::Errors::MissingRequireParameters
    end

    it 'calls SypFu::Request' do
      expect(SpyFu::Request).to receive(:new).with('/apis/weeklytracking_api/delete_term',
                                                   [:listId, :domainId, :termId], {})
                                  .and_return(double(send_request: ''))
      subject.delete_term({})
    end
  end
end
