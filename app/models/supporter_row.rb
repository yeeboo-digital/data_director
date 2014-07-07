class SupporterRow < ActiveRecord::Base
  
  belongs_to :supporter, counter_cache: :supporter_rows_count
  
  before_validation :format_data_file
  before_validation :format_data_type
  
  def normalize!
    DataDirector::Normalize.call(self)
  end
  
  def data_attributes
    @data_attributes ||= JSON.parse(data) rescue {}
  end
  
  def data_attributes=(attrs)
    output = self.data_attributes.merge(attrs)
    self.data = output.to_json
    @data_attributes = nil
    output
  end
  
  private
  
  def format_data_file
    self.data_file = File.basename(data_file) if data_file.present?
  end
  
  def format_data_type
    self.data_type = data_type.to_s.downcase.strip.rstrip if data_type_changed?
  end
  
end