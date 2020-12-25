class ShoppingList < ApplicationRecord
  has_many :shopping_lists_groups, dependent: :destroy
  has_many :groups, -> { distinct }, through: :shopping_lists_groups, dependent: :destroy
  belongs_to :author, class_name: 'User'

  validates :name,
            presence: { message: 'Name must be given' },
            length: { in: 4..30, message: 'Name length must be between 4 to 30 characters' },
            uniqueness: { message: 'Name already exists' }

  validates :amount,
            presence: { message: 'Amount must be given' },
            numericality: { only_integer: true, message: 'Amount must be numeric' }

  def icons?
    return true if shopping_lists_groups.present?
  end
end
