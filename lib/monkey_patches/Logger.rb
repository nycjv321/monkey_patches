require 'logger'

# Original Code for this module can be found here
#  http://stackoverflow.com/questions/917566/ruby-share-logger-instance-among-module-classes
module Logging

  def logger
    @logger ||= Logging.logger_for(self.class.name)
  end

  # Use a hash class-ivar to cache a unique Logger per class:
  @loggers = {}

  class << self
    def logger_for(classname)
      @loggers[classname] ||= configure_logger_for(classname)
    end

    def configure_logger_for(classname)
      logger = Logger.new(STDOUT)
      logger.progname = classname
      logger
    end
  end

  # Turn off debugging. Will now only display errors and fatal messages.
  def turn_off_debugging
    logger.level = Logger::ERROR
  end

  # Turn on debugging
  def turn_on_debugging
    logger.level = Logger::DEBUG
  end

  def debugging_enabled?
    if logger.level == Logger::DEBUG
      return true
    else
      return false
    end
  end

end