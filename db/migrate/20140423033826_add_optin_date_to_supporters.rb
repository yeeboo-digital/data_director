class AddOptinDateToSupporters < ActiveRecord::Migration
  def change
    add_column :supporters, :optin_date, :datetime
  end
end
