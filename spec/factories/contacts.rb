FactoryBot.define do
  factory :contact do
    id {100}
    name {"contact_name"}
    phone {"contact_phone"}
    email {"contact_email@email.com"}
    association :user
    message {"contacto !"}
    

    
  end
end
