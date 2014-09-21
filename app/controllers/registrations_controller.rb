class RegistrationsController < Devise::RegistrationsController

  def new
    @registration = Registration.new
  end

   def create
    @registration = Registration.new(params[:user])

    if @registration.save
      @user = @registration.user
      set_flash_message :notice, :signed_up
      sign_up(resource_name, @user)
      # respond_with @user, location: after_sign_up_path_for(@user)
      # redirect_to edit_user_registration_path(@user)
      redirect_to @user.accounts.last
    else
      render :new
    end
  end

end