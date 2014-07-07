require 'csv'

module DataDirector
  class Import

    attr_accessor :file, :headers, :line
    
    def initialize(file, headers=[])
      @file = file
      @headers = headers
    end
    
    def each(&block)
      CSV.open( file ).each do |row|
        data = process(row)
        block.call( data, line ) if data.present?
      end
    end
    
    private
    
    def process(row)
      self.line = line + 1
      headers.present? ? process_row(row) : process_headers(row)
    end
    
    def process_row(row)
      data = {}
      row.each_with_index do |value, index|
        key = headers[index]
        data[key] = value
      end
      data
    end
    
    def process_headers(row)
      self.headers = row
      false
    end
    
    def line
      @line ||= 0
    end
    
  end
end