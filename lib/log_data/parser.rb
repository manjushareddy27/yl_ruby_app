# frozen_string_literal: true

module LogData
  class Parser
    attr_reader :logs

    def initialize(logs)
      @logs = logs
    end

    def views_count_per_page
      return if logs.empty?

      logs.group_by { |log| log[:url_path] }.transform_values! do |obj_array|
        ip_addresses = obj_array.collect { |l| l[:ip_address] }
        { views_count: ip_addresses.count,
          unique_views_count: ip_addresses.uniq.count }
      end
    end
  end
end
