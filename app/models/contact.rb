class Contact < ApplicationRecord
<<<<<<< HEAD
=======
  #Associatios
  belongs_to :user, optional: true

     #Validations
     validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },  presence: true
     validates :name, 
               :phone,
               :user,
               presence: true
>>>>>>> a418726c576720aab6d9d3793de6d332381e5726
end
