class Medicine < ApplicationRecord
  has_many :medicine_categories
  has_many :categories, through: :medicine_categories

  accepts_nested_attributes_for :categories

  has_one_attached :picture
end
