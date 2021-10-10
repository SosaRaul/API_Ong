class Contact < ApplicationRecord
  #Associatios
  belongs_to :user, optional: true

     #Validations
     validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },  presence: true
     validates :name, 
               :phone,
               :message,
               presence: true
end
