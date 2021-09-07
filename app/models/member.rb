class Member < ApplicationRecord
    validates :name, presence :true, uniqueness :true
    validates :facebookUrl,:instagramUrl,:linkedinUrl,:description allow_blank :true    
end
