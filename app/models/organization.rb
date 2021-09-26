class Organization < ApplicationRecord

    has_many :slides
    has_one_attached :image

    validates :name, presence: true 
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },  presence: true
    
    def image_url
        image.url
    end    
end
