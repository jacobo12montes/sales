class Group < ApplicationRecord
  has_one_attached :icon
  belongs_to :user
  has_many :sales
  validates :name, presence: true, length: { minimum: 3 }
end
