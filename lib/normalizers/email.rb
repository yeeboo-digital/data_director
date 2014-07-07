class Normalizers::Email < DataDirector::Normalize
  include DataDirector::Normalize::Record
  
  def perform
    return if record.supporter_id.present?
    record.supporter = Supporter.find_or_create_by_email( email )
    record.save
  end
  
  private
  
  def email
    email_keys.each do |key|
      return data[key] if data[key] =~ /@/
    end
    nil
  end
  
  def email_keys
    data.keys.select{|k| k =~ /email/i }
  end
  
end