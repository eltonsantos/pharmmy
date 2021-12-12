class AddUserToMedicines < ActiveRecord::Migration[6.1]
  def change
    add_reference :medicines, :user, null: true, foreign_key: true
  end
end
