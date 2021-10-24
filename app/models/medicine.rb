class Medicine < ApplicationRecord
  has_many :medicine_categories
  has_many :categories, through: :medicine_categories
end
