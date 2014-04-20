Promiscuous.configure do |config|
  config.publisher_exchange   = 'spree-app'
  config.subscriber_exchanges = ['diaspora', 'diaspora-topic']
  config.logger = Logger.new(STDERR).tap { |l| l.level = 0 }
  config.instrumentation_file = '/tmp/instrumentation.log'
  config.redis_url            = 'redis://localhost:7779/'
end
