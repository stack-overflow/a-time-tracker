require 'rails_helper'

RSpec.describe PasswordsController, :type => :controller do

  include Devise::TestHelpers
  before do 
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "after_resetting_password_path_for(resource_name)" do

  	let(:user) { User.create!(first_name: 'Michal', last_name: 'Rudnik', email: 'michal@wp.pl', password: '12345678', password_confirmation: '12345678') }
  	let(:account) { user.accounts.create!(company: 'Alfa', name: 'Nowy account') }
  	
    it "redirects to account_path(account)" do
      account
      post :create, user: { email: user.email }
      password = '123456781'
      password_confirmation = '123456781'
      # user.send :set_reset_password_token
      user.reload


        put :update, user: {
          password: password,
          password_confirmation: password_confirmation,
          reset_password_token: user.reset_password_token
        }
      # expect(assigns(:user).errors).to eq(user.reset_password_token)
      expect(response).to redirect_to(account_path(user.accounts.last))
    end

  end

end