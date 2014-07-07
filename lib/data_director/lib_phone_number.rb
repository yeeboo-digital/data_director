module DataDirector
  class LibPhoneNumber
  
    VERSION='1'
  
    class << self
    
      def find(number, country)
        self.new( DataDirector::LibPhoneNumber::LibJs.find(number, country) )
      end
    
      def redis
        @redis ||= Redis::Namespace.new("libphonenumber-#{VERSION}")
      end
    
    end
  
    attr_accessor :country, :number, :e164format, :type, :attributes
  
    def initialize(attrs)
      self.attributes = attrs
      attrs.each{|k,v| self.send( "#{k}=", v ) }
    end
  
    def type_code
      type
    end
  
    def to_s
      e164format.to_s
    end
  
  end
end