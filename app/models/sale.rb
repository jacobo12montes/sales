class Sale < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  scope :ordered_by_most_recent, -> { order(date: :desc) }
  scope :ordered_by_group, -> { where(group_id: nil) }
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :amount, numericality: true
end
