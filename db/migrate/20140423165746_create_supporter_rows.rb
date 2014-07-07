class CreateSupporterRows < ActiveRecord::Migration
  def change
    create_table :supporter_rows do |t|
      t.integer :supporter_id
      t.text :data
      t.string :data_type
      t.string :data_file
      t.integer :data_line

      t.timestamps
    end
    add_index :supporter_rows, :supporter_id
    add_index :supporter_rows, :data_type
    add_index :supporter_rows, [:data_type, :data_line]
  end
end