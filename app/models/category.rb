class Category < ActiveRecord::Base
    has_many :chain_categories
    has_many :chains, through: :chain_categories
    validates :name, presence: true, length: { maximum: 50 }
    validates_uniqueness_of :name
end