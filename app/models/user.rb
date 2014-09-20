class User < ActiveRecord::Base
	has_many :user_accounts
	has_many :accounts, through: :user_accounts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
