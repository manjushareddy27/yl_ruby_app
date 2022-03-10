# frozen_string_literal: true

Dir.glob('lib/**/*.rb') { |f| require_relative f }

log_presenter = LogData::Presenter.new(file_name: ARGV[0])
log_presenter.display_result( log_presenter.total_views, 'views')
log_presenter.display_result( log_presenter.uniq_views, 'unique views')
