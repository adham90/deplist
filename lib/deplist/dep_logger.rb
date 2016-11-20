require 'logger'

class DepLogger
  LOG_DIR  = 'log'.freeze
  LOG_FILE = "#{LOG_DIR}/deplist.log".freeze

  class << self
    def error(msg)
      logger.error(msg)
    end

    def info(msg)
      logger.info(msg)
    end

    private

    def logger
      FileUtils.mkdir_p(LOG_DIR)

      @@logger ||= begin
                     Logger.new(LOG_FILE)
                   end
    end
  end
end
