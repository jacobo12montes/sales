class Sale < ApplicationRecord
  has_one_attached :picture
  
  belongs_to :user
  has_many :groupsales
  has_many :groups, through: :groupsales
  
  scope :ordered_by_most_recent, -> { order(date: :desc) }
  # scope :ordered_by_group, -> { where(group_id: nil) }
  # scope :ordered_group, -> (id) { where(group_id: id) }
  
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :amount, numericality: true

  # scope :in_a_group, ->(id) { joins(:groupsales).where(group_id: => id) }  

end
