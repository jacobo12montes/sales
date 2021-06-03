class Sale < ApplicationRecord
  has_one_attached :picture
  
  belongs_to :user
  has_many :groupsales
  has_many :groups, through: :groupsales
  
  scope :total, -> { sum('amount') }

  scope :ordered_by_most_recent, -> { order(date: :desc) }
  
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :amount, numericality: true

  # scope :userowner, lambda { |current_user|
  #   left_joins(:groupsales).where('groupsales is null', user_id: current_user)
  # }

  scope :externals, { |current_user|
    left_joins(:groupsales).where('groupsales is null', user_id: current_user)
  }
end
