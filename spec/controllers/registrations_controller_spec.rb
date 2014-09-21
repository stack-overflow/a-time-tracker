require 'rails_helper'

RSpec.describe RegistrationsController, :type => :controller do

  include Devise::TestHelpers
  before do 
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "NEW registration" do
 
    context 'Invalid' do

      it "does not create new Registration" do
        expect {
          post :create, user: {first_name: 'Michal', last_name: 'Rudnik', email: 'abc', password: '12345678', password_confirmation: '12345678', name: 'MyCoolAccount', company: 'MyCoolCompany', terms_of_service: '1'}
        }.to change(User, :count).by(0)
      end

    end

    context 'Valid' do

      it "creates new Registration" do
        expect {
          post :create, user: {first_name: 'Michal', last_name: 'Rudnik', email: 'abc@abc.pl', password: '12345678', password_confirmation: '12345678', name: 'MyCoolAccount', company: 'MyCoolCompany', terms_of_service: '1'}
          # expect(assigns(:registration).errors.full_messages).to eq({})
        }.to change(User, :count).by(1)
      end

    end    

  end

end
