module Textalytics
  def self.connection
    Thread.current[:textalytics_connection] ||=
      Faraday.new(:url => 'https://textalytics.com/api/',
                  :ssl => {:verify => false}) do |builder|
        # builder.use     Market::FaradayMiddleware
        builder.request :url_encoded
        builder.response :json

        builder.options[:open_timeout] = 10
        builder.options[:read_timeout] = 10
        builder.adapter :net_http_persistent
    end
  end

  def self.get_media(text, options={})
    options[:language] ||= 'en'
    options[:source]   ||= 'TWITTER'
    options[:timeref]  ||= Time.now
    options[:txt]      ||= text
    options[:id]       ||= '1'

    r = connection.post('media/1.0/analyze',
                        :key => '4984e7eec62e684c5a0b8128564379f9',
                        :fields => 'sentiment|categories|entities|concepts',
                        :doc => {:document => options}.to_json)
    raise r.body['status']['message'] unless r.status == 200
    r.body['result']
  end
end
