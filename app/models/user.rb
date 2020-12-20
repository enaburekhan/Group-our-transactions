class User < ApplicationRecord
  has_many :shopping_lists, foreign_key: :author_id, dependent: :destroy
  has_many :groups, dependent: :destroy
  
  validates :username, presence: { message: 'Username must be given' },
                       length: { in: 4..20, message: 'Username length must be between 4 to 20 characters' },
                       uniqueness: { message: 'Username already exists' },
                       format: { with: /\A[a-zA-Z0-9]+\z/, message: 'Username must be alphanumeric' }
  
  def all_total_amount
    shopping_lists.where(active: true).sum(:amount)
  end
  
  def list_shopping_lists_join_groups
    new_list = []
    shopping_lists.includes(:shopping_lists_groups).each do |item|
      new_list << item unless Shopping_listsGroup.find_by(shopping_list_id: item.id).present?
    end
    new_list
  end
  
  def shopping_lists_order_recent
    shopping_lists.includes(:shopping_lists_groups).order(created_at: :desc).where(active: true)
  end
  
  def shopping_lists_order_ancient
    shopping_lists.includes(:shopping_lists_groups).order(:created_at).where(active: true)
  end    
end
