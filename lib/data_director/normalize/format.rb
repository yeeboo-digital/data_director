module DataDirector
  class Normalize
    module Format
      extend ActiveSupport::Concern
      
      included do
        include DataDirector::Normalize::Record
      end
      
      module ClassMethods
        
        def format(*args)
          @format_attributes = format_attributes + Array(args).flatten
        end
        
        def format_attributes
          @format_attributes ||= []
        end
        
      end
  
      def perform
        attributes.each do |key|
          perform_format(key)
        end
      end
  
      private
      
      def perform_format(key)
        value = format( key, record.send(key) )
        record.send("#{key}=", value )
        
      rescue => err
        Rails.logger.debug(err)
        
      end
  
      def attributes
        self.class.format_attributes
      end
  
    end
  end
end