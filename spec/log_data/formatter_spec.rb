# frozen_string_literal: true

require 'spec_helper'
RSpec.describe LogData::Formatter do
  let(:file_name) { 'spec/fixtures/sample.log' }

  describe '#perform' do
    subject(:formatter_request) { described_class.new(file_name).perform }

    context 'when valid log file has passed' do
      it 'returns formatted log details' do
        expect(formatter_request.count).to eq(4)
        expect(formatter_request).to include({ url_path: 'home', ip_address: '184.123.665.067' })
      end
    end
  end

  describe '#errors' do
    subject(:formatter_request) { described_class.new(file_name).perform }

    context 'when invalid log file has passed' do
      let(:file_name) { 'spec/fixtures/unknown.log' }

      it 'returns an error' do
        expect { formatter_request }.to output("File not found. Please enter a valid file path.\n").to_stdout.and raise_error(SystemExit)
      end
    end

    context 'when empty log file has passed' do
      let(:file_name) { '' }

      it 'returns an error' do
        expect { formatter_request }.to output("Please provide a file path.\n").to_stdout.and raise_error(SystemExit)
      end
    end
  end
end
