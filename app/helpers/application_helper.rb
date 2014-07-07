module ApplicationHelper
  def chart_conditions
    @chart_conditions || {}
  end
  def chart_csv_link(url_name)
    link_to( 'CSV', self.send(url_name, chart_conditions.merge(format: 'csv')), class: 'icon-save', target: :blank )
  end
  
end
