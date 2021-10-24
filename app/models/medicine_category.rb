class MedicineCategory < ApplicationRecord
  belongs_to :medicine
  belongs_to :category
end
