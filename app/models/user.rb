class User < ActiveRecord::Base
	has_many :user_accounts
	has_many :accounts, through: :user_accounts
	
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, 
                    uniqueness: { case_sensitive: false }

	validates :password, length: { minimum: 6 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
