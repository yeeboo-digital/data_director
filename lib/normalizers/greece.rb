class Normalizers::Greece < DataDirector::Normalize
  include DataDirector::Normalize::Mapping
  
  perform_when_data_type_matches 'greece'
  
  map({
    "Opt In Date"        => :legacy_optin_date,
    "Opted Out"          => :email_opt_out,
    "Opt In Details"     => :legacy_optin_details,
    "Email Type"         => :email_type,
    "CRM Lead Source"    => :source,
    "Address1"           => :address_1,
    "Address2"           => :address_2,
    "City"               => :city,
    "Country"            => :country,
    "DateOfBirth"        => :date_of_birth,
    "First_Name"         => :first_name,
    "Name"               => :full_name,
    "Gender"             => :gender,
    "HomePhone"          => :phone_number,
    "Hotwheels Letter"   => :done_toxics,
    "Last_Name"          => :last_name,
    "WorkPhone"          => :phone_work,
    "detox_zebra"        => :done_toxics,
  })
  
end