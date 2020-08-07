class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders
  has_one :address
  
  with_options presence: true do |assoc|
    assoc.validates :first_name
    assoc.validates :family_name
    assoc.validates :nickname
    assoc.validates :first_name_kana
    assoc.validates :family_name_kana
    assoc.validates :birthday
    assoc.validates :email
    assoc.validates :password
  end
  with_options uniqueness: true do |assoc|
    assoc.validates :nickname
    assoc.validates :email
  end
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 7 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }
end
