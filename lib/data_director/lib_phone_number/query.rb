require 'redis'
require 'redis/namespace'
require 'rest_client'

module DataDirector
  class LibPhoneNumber
    class Query
  
      API="new-moon.data_director.org/libphonenumber/"
      EXPIRY=24.hours
  
      attr_accessor :number, :country
  
      def self.find(*args)
        self.new(*args).fetch
      end
  
      def initialize(number, country)
        self.number = number
        self.country = country
      end
  
      def fetch
        perform_query_with_caching
      end
  
      def number=(value)
        @number = value.to_s.gsub(" ", '')
      end
  
      protected

      def perform_query_with_caching
        get_cached || set_cached( perform_query )
      end
  
      def perform_query
        t1 = Time.now
        result = JSON.parse(RestClient.get("#{query_url}")[1..-2].gsub("'", '"'))
        Rails.logger.debug("[#{t1.elapsed_ms}] DataDirector::LibPhoneNumber.query_api(#{query_url})")
        result
      end
  
      def query_url
        "#{API}?c=#{country}&n=#{number}"
      end
  
      def set_cached(value)
        redis.set( cache_key, value.to_json )
        value
      end

      def get_cached
        value = redis.get(cache_key)
        value = JSON.parse(value) if value.present?
        value
      end
  
      def cache_key
        "#{country}:#{number}"
      end
  
      def redis
        DataDirector::LibPhoneNumber.redis
      end
  
    end
  end
end