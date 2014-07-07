module DataDirector
  class Normalize
    module Record
      extend ActiveSupport::Concern
      
      included do
        attr_accessor :record
      end
      
      module ClassMethods
        
        def perform_when_data_type_matches(*args)
          @matching_data_type = matching_data_type + Array(args).flatten
        end
        
        def matching_data_type
          @matching_data_type ||= []
        end
        
      end
      
      def call(record)
        @record = record
        perform if matches_data_type?(record.data_type)
        record
      end
      
      def method_missing(method_name, *args, &block)
        if record.respond_to?(method_name)
          record.send( method_name, *args, &block ) 
        else
          super
        end
      end
  
      private
      
      def matches_data_type?(type)
        return true if matching_data_type.blank?
        matching_data_type.each do |t|
          pattern = Regexp.new(t) unless t.is_a?(Regexp)
          return true if type =~ pattern
        end
        false
      end
      
      def matching_data_type
        self.class.matching_data_type
      end
      
      def data
        record.data_attributes
      end
  
    end
  end
end