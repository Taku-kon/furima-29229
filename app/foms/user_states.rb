class UserStates

  include ActiveModel::Model
  attr_accessor :email, :password, :nickname, :birthday, :first_name, :last_name, :first_kana, :last_kana

  with_options presence: true do
    validates :password, length: { minimum: 6 } format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :email, uniqueness: true, format: {with:  /\A\S+@\S+\.\S+\z/ }
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    KANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :last_name, format: {with: NAME_REGEX }
    validates :last_kana, format: {with: KANA_REGEX }
    validates :first_name, format: {with: NAME_REGEX }
    validates :first_kana, format: {with: KANA_REGEX }
  end

  def save
    user = User.create (email: email, password: password, nickname: nickname, birthday: birthday, first_name: first_name, last_name: last_name, first_kana: first_kana, last_kana: last_kana)
  end
end