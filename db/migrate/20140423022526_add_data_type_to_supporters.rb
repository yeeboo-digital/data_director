class AddDataTypeToSupporters < ActiveRecord::Migration
  def change
    add_column :supporters, :data_type, :string
  end
end
