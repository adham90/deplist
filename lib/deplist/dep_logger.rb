require 'logger'

class DepLogger
  LOG_FILE = 'log/deplist.log'.freeze

  def self.error(msg)
    FileUtils.mkdir_p 'log'
    Logger.new(LOG_FILE).error(msg)
  end

  def self.info(msg)
    FileUtils.mkdir_p 'log'
    Logger.new(LOG_FILE).info(msg)
  end
end
