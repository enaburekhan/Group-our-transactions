class Group < ApplicationRecord
  has_many :shopping_lists_groups
  has_many :shopping_lists, -> { distinct }, through: :shopping_lists_groups, dependent: :destroy
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  
  validates :name,
            presence: { message: 'Group name must be given' },
            uniqueness: { message: 'Group name already exists' },
            length: { in: 1..30, message: 'Group name length must be between 1 to 30 characters' }
  
  validates :icon, presence: { message: 'Icon must be given' }    
end
