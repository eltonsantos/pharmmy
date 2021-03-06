class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :symptoms, dependent: :destroy
  has_many :medicines, dependent: :destroy

  enum role: { guest: 0, admin: 1 }
end
