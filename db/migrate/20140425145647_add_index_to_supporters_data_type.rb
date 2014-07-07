class AddIndexToSupportersDataType < ActiveRecord::Migration
  def change
    add_index :supporters, [:data_type, :supporter_rows_count]
  end
end
