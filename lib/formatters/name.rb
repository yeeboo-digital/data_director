# encoding: UTF-8
class Formatters::Name < DataDirector::Formatter
  include DataDirector::Normalize::Format
  
  format :full_name
  
  def format(key, v)
    v = [first_name, last_name].compact.join(" ") if v.blank?
    v
  end

end