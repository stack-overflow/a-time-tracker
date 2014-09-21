class PasswordsController < Devise::PasswordsController

  protected
  def after_resetting_password_path_for(resource_name)
    account_path(current_user.accounts.last)
  end
  
end