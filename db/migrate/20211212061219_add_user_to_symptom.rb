class AddUserToSymptom < ActiveRecord::Migration[6.1]
  def change
    add_reference :symptoms, :user, null: false, foreign_key: true
  end
end
