class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy

  # validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def to_param
    username
  end
end
