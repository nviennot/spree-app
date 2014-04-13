Promiscuous.configure do |config|
  config.publisher_exchange   = 'spree-app'
  config.subscriber_exchanges = ['diaspora', 'diaspora-topic']

  config.logger = Logger.new(STDERR)
  config.logger.level = 0
end
