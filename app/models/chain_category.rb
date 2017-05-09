class ChainCategory < ActiveRecord::Base
    belongs_to :chain
    belongs_to :category
end