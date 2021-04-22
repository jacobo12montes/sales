class Sale < ApplicationRecord
    has_one_attached :picture
    belongs_to :user
    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
