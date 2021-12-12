class Category < ApplicationRecord
  has_many :medicine_categories, dependent: :destroy
  has_many :medicines, through: :medicine_categories

  belongs_to :user

end
