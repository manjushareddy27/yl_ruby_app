# frozen_string_literal: true

require 'spec_helper'
RSpec.describe LogData::Parser do
  let(:logs) do
    [{ url_path: 'home', ip_address: '184.123.665.067' },
     { url_path: 'help_page/1', ip_address: '929.398.951.889' },
     { url_path: 'help_page/1', ip_address: '822.247.931.582' },
     { url_path: 'help_page/1', ip_address: '822.247.931.582' }]
  end

  describe '#views_count_per_page' do
    subject(:request) { described_class.new(logs).views_count_per_page }

    context 'when valid logs has passed' do
      it 'returns formatted log details' do
        expect(request.count).to eq(2)
        expect(request['help_page/1'][:views_count]).to eq(3)
        expect(request['help_page/1'][:unique_views_count]).to eq(2)
      end
    end

    context 'when empty logs has passed' do
      let(:logs) { '' }

      it 'returns an empty array' do
        expect(request).to be(nil)
      end
    end
  end
end
