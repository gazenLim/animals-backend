class Animal < ApplicationRecord
    validates :name, presence: true
    validates :image, presence: true

    validates :description, presence: true
    belongs_to :category
end
