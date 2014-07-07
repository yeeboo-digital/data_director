class Formatters::Boolean < DataDirector::Formatter
  include DataDirector::Normalize::Format
  
  def format(key, v)
    return 'N' if v.blank?
    v = v.to_s.upcase.strip.rstrip
    return 'Y' if v == true || v == 'YES' || v == 'TRUE' || v == 'T' || v == 'Y'
    return 'N' if v == false || v == 'NO' || v == 'FALSE' || v == 'F' || v == 'OPTED OUT' || v == 'OPT OUT VIA ONE CLICK OPT OUT' || v == 'N'
    ''
  end

end