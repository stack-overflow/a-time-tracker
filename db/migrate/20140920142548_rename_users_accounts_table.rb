class RenameUsersAccountsTable < ActiveRecord::Migration
  def change
  	rename_table :users_accounts, :user_accounts
  end
end
