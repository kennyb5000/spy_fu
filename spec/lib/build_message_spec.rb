require 'spec_helper'

describe SpyFu::BuildMessage do
  subject { SpyFu::BuildMessage }

  describe '#call' do
    it 'returns if valid' do
      timestamp = Time.now.to_s
      res = subject.new('foo/bar', {}, timestamp)
      expect(res.call).to eq "GET\n#{timestamp}\nfoo/bar\n"
    end

    describe 'errors' do
      context 'url_path' do
        it 'fails MissingUrl if url_path is nil' do
          res = subject.new(nil, {}, Time.now)
          expect { res.call }.to raise_error SpyFu::Errors::MissingUrl
        end

        it 'fails MissingUrl if url_path is blank' do
          res = subject.new('', {}, Time.now)
          expect { res.call }.to raise_error SpyFu::Errors::MissingUrl
        end
      end
    end
  end

  describe '#build_canonicalized_params' do
    context 'in query_string' do
      it 'return string' do
        res = subject.new('foo/bar', { q: 'foo', r: 'bar' }, Time.now)
        expect(res.build_canonicalized_params).to eq('q=foo&r=bar')
      end

      it 'return string while respecting spaces' do
        res = subject.new('foo/bar', { q: 'foo bar', r: 'baz' }, Time.now)
        expect(res.build_canonicalized_params).to eq('q=foo bar&r=baz')
      end
    end
  end
end
