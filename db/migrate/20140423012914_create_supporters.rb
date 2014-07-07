class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      t.string :supporter_id
      t.string :email
      t.string :external_id_fr_crm
      t.string :external_id_greenwire
      t.string :email_opt_out
      t.string :email_ok
      t.string :email_type
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :full_name
      t.string :company
      t.string :date_of_birth
      t.string :year_of_birth
      t.string :gender
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :city
      t.string :region
      t.string :postcode
      t.string :country
      t.string :language_pref
      t.string :contact_codes
      t.string :communication_codes
      t.string :gp_interests
      t.string :source
      t.text :legacy_optin_details
      t.string :legacy_optin_date
      t.string :fr_rg_amount
      t.string :fr_rg_frequency
      t.string :fr_rg_last_gift_date
      t.string :petition_shell
      t.string :phone_number
      t.string :phone_type
      t.string :phone_work
      t.string :phone_mobile
      t.string :phone_fax
      t.string :birth_day
      t.string :birth_month
      t.string :birth_year
      t.string :is_volunteer
      t.string :opt_in_status

      t.timestamps
    end
  end
end
