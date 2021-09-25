class Organization < ApplicationRecord
    has_many :slides
    has_one_attached :image

    def image_url
        image.url 
    end    
end
