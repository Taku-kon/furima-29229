class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :password, length: { minimum: 6 }, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :email, uniqueness: true, format: {with:  /\A\S+@\S+\.\S+\z/ }
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    KANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :last_name, format: {with: NAME_REGEX }
    validates :last_kana, format: {with: KANA_REGEX }
    validates :first_name, format: {with: NAME_REGEX }
    validates :first_kana, format: {with: KANA_REGEX }
  end
  has_many:items
end