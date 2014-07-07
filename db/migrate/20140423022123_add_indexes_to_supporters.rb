class AddIndexesToSupporters < ActiveRecord::Migration
  def change
    add_index :supporters, :email
    add_index :supporters, :gender
    add_index :supporters, :city
    add_index :supporters, :region
    add_index :supporters, :country
    add_index :supporters, :language_pref
    add_index :supporters, :source
    
    add_index :supporters, :birth_day
    add_index :supporters, :birth_month
    add_index :supporters, :birth_year
    
    add_index :supporters, [:country, :email]
    
  end
end
