class SessionsController < Devise::SessionsController

  protected
  def after_sign_in_path_for(resource)
    account_path(current_user.accounts.last)
  end
  
end