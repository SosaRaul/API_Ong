class Category < ApplicationRecord
    
    #Associations
    has_one_attached :image
   
    #Validations
    validates :name, uniqueness: true,
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

    scope :paginate, -> (page, per_page: 5) { 
        page = page || 1   #make page = 1 by default if there is no param
        limit(per_page).offset(per_page * (page.to_i - 1))
     }
     
end


