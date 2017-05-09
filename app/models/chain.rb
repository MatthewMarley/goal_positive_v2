class Chain < ActiveRecord::Base
     belongs_to :user
     has_many :chain_categories
     has_many :categories, through: :chain_categories
     validates :name, presence: true, length: { maximum: 50 }
     # validates :user_id, presence: true
end