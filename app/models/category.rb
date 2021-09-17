class Category < ApplicationRecord
    
    #Associations
    #belongs_to:
    #has_many or has_one:
    has_one_attached :image
   
    #Validations
    validates :name, 
              presence: true
    
    #Scopes          
    def soft_delete
        update_column("deleted_at", Time.current) 
        update("soft_deleted": true)
    end
    def undelete
        update(soft_deleted: false)
    end
    scope :not_deleted, -> { where(soft_deleted: false) }
    scope :deleted, -> { where(soft_deleted: true) }
end


