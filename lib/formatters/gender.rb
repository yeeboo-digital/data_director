# encoding: UTF-8

class Formatters::Gender < DataDirector::Formatter
  include DataDirector::Normalize::Format
  
  format :gender
  
  def format(key, v)
    v = v.to_s.downcase.strip.rstrip
    return '' if v.blank?
    return 'other'  if %w{o other u unknown family}.include?(v)
    return 'male'   if %w{m male b boy males м masculino 2}.include?(v)
    return 'female' if %w{f female g girl ж 1 femenino}.include?(v)
    return 'female' if v == '여자'
    return 'male'   if v == '남자'
    ''
  end

end