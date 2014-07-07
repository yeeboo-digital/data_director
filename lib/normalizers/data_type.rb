class Normalizers::DataType < DataDirector::Normalize
  include DataDirector::Normalize::Record
  
  def perform
    return if record.supporter_id.blank?
    record.supporter.data_type = "#{record.supporter.data_type},#{record.data_type}" unless record.supporter.data_type =~ /#{record.data_type}/
  end
  
end