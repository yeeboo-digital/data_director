module DataDirector
  class Normalize
    module Mapping
      extend ActiveSupport::Concern
      
      included do
        include DataDirector::Normalize::Record
      end
      
      module ClassMethods
        
        def map(hash)
          self.mapping.merge!(hash)
        end
        
        def mapping
          @mapping ||= {}
        end
        
      end
      
      def perform
        return failed_mapping if record.supporter_id.blank?
        apply_mapping
      end
      
      private
      
      def apply_mapping
        self.class.mapping.each do |legacy_key, normalized_key|
          record.supporter.send "#{normalized_key}=", record.data_attributes[legacy_key]
        end
      end
      
      def failed_mapping
        Rails.logger.error("#{record.id} missing supporter")
        return false
      end
  
    end
  end
end