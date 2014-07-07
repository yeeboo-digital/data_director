module DataDirector
  class Formatter
    
    class << self
      
      def call(record)
        self.new.call(record)
      end
      
      def inherited(subclass)
        DataDirector::Formatter.subclasses << subclass unless DataDirector::Formatter.subclasses.include?(subclass)
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
      output.save if output.changed?
      output
    end
    
    private
    
    def assert_call_implemented!
      raise NotImplementedError.new("#{self.class}: You must implement call.") unless self.class == DataDirector::Formatter
    end
    
  end
end