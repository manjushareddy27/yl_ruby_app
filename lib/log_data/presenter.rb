# frozen_string_literal: true

module LogData
  class Presenter
    attr_reader :file_name

    def initialize(file_name:)
      @file_name = file_name
    end

    def total_views
      log_parser.sort_by { |_k, v| -v[:views_count] }
    end

    def uniq_views
      log_parser.sort_by { |_k, v| -v[:unique_views_count] }
    end

    def display_result(list, suffix)
      puts "\r"
      puts "List of webpages with most page #{suffix} ordered from most pages views to less page views"
      puts '----------------------------------------------'
      puts 'Page path            | Number of views'
      puts '----------------------------------------------'
      list.map { |k, v| puts "#{k&.ljust(20)} #{v[:views_count]}" }
      puts "\r"
      puts "\r"
    end

    private

    def formatted_logs
      @formatted_logs ||= LogData::Formatter.new(file_name).perform
    end

    def log_parser
      @log_parser ||= LogData::Parser.new(formatted_logs).views_count_per_page
    end
  end
end
