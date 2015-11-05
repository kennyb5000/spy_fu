require 'spec_helper'

describe SpyFu::BuildRequest do
  subject { SpyFu::BuildRequest }

  describe 'build_request' do
    subject { SpyFu::BuildRequest.new('/foo/bar', {}).build_request }

    it 'calls HTTParty' do
      expect(HTTParty).to receive(:get)

      subject
    end

    it 'calls BuildMessage' do
      expect_any_instance_of(SpyFu::BuildMessage).to receive(:call).and_return('')

      subject
    end

    it 'calls BuildSignature' do
      expect_any_instance_of(SpyFu::BuildSignature).to receive(:call).and_return('')

      subject
    end

    it 'sets the headers to use the timestamp and signature' do
      allow_any_instance_of(SpyFu::BuildRequest).to receive(:build_timestamp).and_return('timestamp')
      allow_any_instance_of(SpyFu::BuildSignature).to receive(:call).and_return('signature')

      expect(HTTParty).to receive(:get).with('http://www.spyfu.com/foo/bar',
                                             headers: { 'Authentication' => 'user_id:signature',
                                                        'Timestamp' => 'timestamp' })

      subject
    end
  end

  describe 'join_url_and_query' do
    context 'in query_string' do
      it 'return string' do
        res = subject.new('/foo/bar', q: 'foo', r: 'bar')
        expect(res.join_url_and_query).to eq('http://www.spyfu.com/foo/bar?q=foo&r=bar')
      end

      it 'return string while respecting spaces' do
        res = subject.new('/foo/bar', q: 'foo bar', r: 'baz')
        expect(res.join_url_and_query).to eq('http://www.spyfu.com/foo/bar?q=foo%20bar&r=baz')
      end
    end
  end
end
