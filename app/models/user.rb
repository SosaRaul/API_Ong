class User < ApplicationRecord

    has_secure_password

    #Associations
    belongs_to :role, optional: true
    has_many :contacts                    

    #Validations
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },  presence: true
    validates :firstName, 
              :lastName,
              presence: true

    #Scopes
    def soft_delete
        update_column("deleted_at", Time.current) 
        update("soft_deleted": true)
    end
    scope :not_deleted, -> { where(soft_deleted: false) }
    scope :deleted, -> { where(soft_deleted: true) }
end

