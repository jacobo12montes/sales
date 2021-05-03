class Sale < ApplicationRecord
    has_one_attached :picture
    belongs_to :user
    scope :ordered_by_most_recent, -> { order(date: :desc) }
    scope :ordered_by_group, -> { where(group_id: nil) }
    validates :amount, numericality: true
end
