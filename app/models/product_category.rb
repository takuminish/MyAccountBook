class ProductCategory < ApplicationRecord
    
    validates :name, presence: true, uniqueness: true
    validates :expense, inclusion: {in: [true, false]}
end
