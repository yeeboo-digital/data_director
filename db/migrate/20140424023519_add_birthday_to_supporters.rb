class AddBirthdayToSupporters < ActiveRecord::Migration
  def change
    add_column :supporters, :birthday, :datetime
  end
end
