class AddIndexToDataType < ActiveRecord::Migration
  def change
    add_index :supporters, :data_type
    add_index :supporters, [:data_type, :country]
  end
end
