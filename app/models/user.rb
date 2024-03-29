class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: true }
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :images
  has_many :comments
  has_many :likes
  
  def full_name
    [first_name, last_name].join(' ')
  end

end
