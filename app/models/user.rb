class User < ApplicationRecord
    include Discard::Model

    #Associations
    #belongs_to: :role, optienal: true                       #ver con el equipo
    #has_many or has_one:

    #Validations
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },  presence: true
    validates :firstName, 
              :lastName,
              :password,
              #:roleId,        ver con el equipo, deberia generarse en la migracion al hacer la asociacion belongs to (:role_id)
              presence: true

    #Scopes
    #def soft_destroy
    #    update_column("deleted_at", Time.current) 
    #end
end

