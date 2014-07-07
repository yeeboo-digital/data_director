class Formatters::Country < DataDirector::Formatter
  include DataDirector::Normalize::Format
  
  format :country
  
  def format(key, v)
    v = v.to_s.downcase.gsub("country:", "") if v.present?
    v = DataDirector::Country.parse(v) unless v.present? && v.length == 2
    v = v.upcase if v.respond_to?(:upcase)
    v
  end

end