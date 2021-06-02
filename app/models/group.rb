class Group < ApplicationRecord
  has_one_attached :icon

  belongs_to :user

  has_many :groupsales
  has_many :sales, through: :groupsales

  validates :name, presence: true, length: { minimum: 3 }
  scope :select_options, -> { all.map { |group| [group.name, group.id] }.unshift(['select a group...', 0]) }
end
