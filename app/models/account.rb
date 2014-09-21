class Account < ActiveRecord::Base
	extend FriendlyId

	has_many :user_accounts
	has_many :users, through: :user_accounts

  friendly_id :name, use: [:slugged, :finders]
end
