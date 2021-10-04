require 'faker'

FactoryBot.define do                      
    factory :user do 
        #id { '1' }
        firstName { "Mar#{id}" }
        lastName { "Del Plata" }
        email { "#{Faker::Name.unique.first_name}@email.com" }
        password { "1234" }
        photo { "image_mar" }
        #role
    end
end