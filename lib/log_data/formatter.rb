# frozen_string_literal: true

module LogData
  class Formatter
    VALID_LOG_ENTRY_REGEX = %r(/(\w+/\d+|\w+) (\d{3}\.\d{3}\.\d{3}.\d{3}))
    LogEntry = Struct.new :url_path, :ip_address

    attr_reader :file_name

    def initialize(file_name)
      @file_name = file_name.to_s
    end

    def perform
      validate_file_path
      format_logs
    rescue StandardError => e
      exit_with_error(e.message)
    end

    private

    def format_logs

      File.foreach(file_name).map do |line|
        line.match(VALID_LOG_ENTRY_REGEX) { |m| LogEntry.new(*m.captures).to_h }
      rescue StandardError
        exit_with_error('Unparsable line detected')
      end.compact
    end

    def validate_file_path
      exit_with_error('Please provide a file path.') if file_name.empty?
      exit_with_error('File not found. Please enter a valid file path.') unless File.exist?(file_name)
    end

    def exit_with_error(error_msg)
      puts error_msg
      exit 1
    end
  end
end
