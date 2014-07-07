class AddSupporterRowsCountToSupporters < ActiveRecord::Migration
  def change
    add_column :supporters, :supporter_rows_count, :integer, default: 0
    Supporter.reset_column_information
    Supporter.find_each do |s|
      Supporter.update_counters s.id, supporter_rows_count: s.supporter_rows.length
    end
  end
end
