class AddColumnsToUserAccount < ActiveRecord::Migration
  def change
    add_column :user_accounts, :name, :string
    add_column :user_accounts, :role, :string
  end
end
