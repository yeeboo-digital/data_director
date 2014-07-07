module DataDirector
  class Normalize
    
    class << self
      
      def call(record)
        self.new.call(record)
      end
      
      def inherited(subclass)
        DataDirector::Normalize.subclasses << subclass unless DataDirector::Normalize.subclasses.include?(subclass)
      end
      
      def subclasses
        @subclasses ||= []
      end
      
    end
    
    def call(record)
      assert_call_implemented!
      output = record
      self.class.subclasses.each do |klass|
        output = klass.call(output)
      end
      output.supporter.save if output.try(:supporter).try(:changed?)
    end
    
    private
    
    def assert_call_implemented!
      raise NotImplementedError.new("#{self.class}: You must implement call.") unless self.class == DataDirector::Normalize
    end
    
  end
end