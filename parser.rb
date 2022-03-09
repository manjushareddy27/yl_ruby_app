require_relative 'log_formatter'
service = LogFormatter.new(file_path: ARGV[0])
service.execute
