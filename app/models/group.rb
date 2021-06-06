class Group < ApplicationRecord
  has_one_attached :icon

  validates :icon, presence: true

  belongs_to :user

  has_many :groupsales
  has_many :sales, through: :groupsales

  scope :total, -> { groupsales.count }

  validates :name, presence: true, length: { minimum: 3 }
  scope :select_options, -> { all.map { |group| [group.name, group.id] }.unshift(['select a group...', 0]) }
end
