class Activity < ApplicationRecord
    validates :name, uniqueness: true
    validates :content, presence: true
    has_one_attached :image
end
