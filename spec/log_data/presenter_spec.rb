# frozen_string_literal: true

require 'spec_helper'
RSpec.describe LogData::Presenter do
  let(:file_name) { 'spec/fixtures/sample.log' }

  describe '#total_views' do
    subject(:request) { described_class.new(file_name: file_name).total_views }

    context 'when valid log file has passed' do
      it 'returns sort by total views of each page' do
        expect(request.count).to eq(2)
        expect(request).to eq([['help_page/1', { views_count: 3, unique_views_count: 3 }],
                               ['home', { views_count: 1, unique_views_count: 1 }]])
      end
    end

    context 'when empty log file has passed' do
      let(:file_name) { '' }

      it 'returns an error' do
        expect { request }.to output("Please provide a file path.\n").to_stdout.and raise_error(SystemExit)
      end
    end
  end

  describe '#uniq_views' do
    subject(:request) { described_class.new(file_name: file_name).uniq_views }

    context 'when valid log file has passed' do
      it 'returns sort by unique views of each page' do
        expect(request.count).to eq(2)
        expect(request).to eq([['help_page/1', { views_count: 3, unique_views_count: 3 }],
                               ['home', { views_count: 1, unique_views_count: 1 }]])
      end
    end

    context 'when empty log file has passed' do
      let(:file_name) { '' }

      it 'returns an error' do
        expect { request }.to output("Please provide a file path.\n").to_stdout.and raise_error(SystemExit)
      end
    end
  end
end
