#encoding:UTF-8
FactoryGirl.define do
  
  factory :user do
    first_name "youngsik"
    last_name "kim"
    status "user-approved"
    email    "dean1@headflow.net"
    password "dudtlr"
    password_confirmation "dudtlr"
    association :team
  end
  
  sequence :email do |n|
    "person-#{n}@example.com"
  end
  
  # factory :mentor do
  #   first_name "kildong"
  #   last_name "hong"
  #   organization_id 1 
  #   status "mentor-approved"
  #   email    "dean1@headflow.net"
  #   password "dudtlr"
  #   password_confirmation "dudtlr"
  # end
  
  factory :admin do
    email    "admin@headflow.net"
    password "dudtlr"
    password_confirmation "dudtlr"
  end
  factory :head_organization do
    name    "kosea"
  end
  
  factory :organization do
    name    "headflow"
    head_organization_id 1
  end
  
  factory :team do
    name    "lifeseed"
    organization_id 1
  end
  

  
  factory :entry do
    # team_id 1
    item_id 1
    invoice_datetime Time.now
    amount 10000
    vendor "vendor"
    payment_method "cash"
    association :team
    association :user
  end
  
  factory :import do
     spreadsheet_file_name "trubeans.xls"
     spreadsheet_file_size 14848
     spreadsheet_updated_at Time.now
     spreadsheet_content_type "application/octet-stream"
     association :team
     association :user
   end
end