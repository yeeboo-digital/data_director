class Supporter < ActiveRecord::Base
  
  has_many :supporter_rows
  
  scope :group_datetime_by_year_and_month, ->(field){ select("to_char(#{field}, 'YYYY-MM') as date, count(id)").group("date").order('date asc') }
  scope :group_datetime_by_year, ->(field){ select("to_char(#{field}, 'YYYY') as date, count(id)").group("date").order('date asc') }
  
  def format!
    DataDirector::Formatter.call(self)
  end
  
  def rows
    supporter_rows
  end
  
end