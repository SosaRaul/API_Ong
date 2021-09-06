class Category < ApplicationRecord
    include Discard::Model

    #Associations
    #belongs_to:
    #has_many or has_one:
    has_one_attached :image
   
    #Validations
    validates :name, 
              :image,
              presence: true
    
    #Scopes          
    #def soft_destroy
    #    update_column("deleted_at", Time.current) 
    #end
end


