class Sale < ApplicationRecord
    has_one_attached :icon
    belongs_to :user
end
