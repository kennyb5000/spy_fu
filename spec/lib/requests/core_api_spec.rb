require 'spec_helper'

describe SpyFu::Requests::CoreApi do
  subject { SpyFu::Requests::CoreApi }

  %i(get_term_metrics_us get_term_metrics_uk get_term_ranking_urls_us get_term_ranking_urls_uk).each do |name|
    describe name do
      it 'fails without term' do
        expect { subject.send(name, {}) }.to raise_error SpyFu::Errors::MissingRequireParameters
      end

      it 'calls SypFu::Request' do
        expect(SpyFu::Request).to receive(:new).with("/apis/core_api/#{name}", [:term], {})
                                    .and_return(double(send_request: ''))
        subject.send(name, {})
      end
    end
  end

  %i(get_term_metrics_bulk_us get_term_metrics_bulk_uk).each do |name|
    describe name do
      it 'fails without termCSV' do
        expect { subject.send(name, nil) }.to raise_error SpyFu::Errors::MissingRequireParameters
      end

      it 'calls SypFu::Request' do
        expect(SpyFu::Request).to receive(:new).with("/apis/core_api/#{name}", [:termCSV], {})
                                    .and_return(double(send_request: ''))
        subject.send(name, nil)
      end

      it 'converts keywords' do
        expect(SpyFu::Request).to receive(:new).with("/apis/core_api/#{name}",
                                                     [:termCSV], termCSV: 'a2V5d29yZCwgb3RoZXI=')
                                    .and_return(double(send_request: ''))
        subject.send(name, %w(keyword other))
      end
    end
  end

  %i(get_domain_metrics_us get_domain_metrics_uk
     get_domain_budget_history_us get_domain_budget_history_uk).each do |name|
    describe name do
      it 'fails without domain' do
        expect { subject.send(name, {}) }.to raise_error SpyFu::Errors::MissingRequireParameters
      end

      it 'calls SypFu::Request' do
        expect(SpyFu::Request).to receive(:new).with("/apis/core_api/#{name}", [:domain], {})
                                    .and_return(double(send_request: ''))
        subject.send(name, {})
      end
    end
  end
end
