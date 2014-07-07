class Formatters::Phone < DataDirector::Formatter
  include DataDirector::Normalize::Format
  
  format :phone_number, :phone_mobile, :phone_work, :phone_fax
  
  def format(key, value)
    return nil if value.blank? || value == 'NULL'
    DataDirector::LibPhoneNumber.find( value, country ).try(:number) if country.present?
  end
  
end