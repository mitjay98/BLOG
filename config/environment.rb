# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.logger = Logger.new("log/#{Rails.env}.log")
Rails.logger.level = Logger::DEBUG
Rails.logger.datetime_format = "%Y-%m-%d %H:%M:%S"

Rails.logger.formatter = proc do | severity, datetime, _progname, msg | 
    "|#{datetime}|#{severity}|#{_progname}|#{msg}\n"
end