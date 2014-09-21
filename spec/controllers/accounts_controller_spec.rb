require 'rails_helper'

RSpec.describe AccountsController, :type => :controller do

  describe "GET show(user)" do

  	let(:user) { User.create(first_name: 'Michal', last_name: 'Rudnik', email: 'michal@wp.pl', password: '12345678') }
  	let(:account) { user.accounts.create(company: 'Alfa', name: 'Nowy account') }
  	
    it "redirects to account" do
    	get :show, id: account
    	expect(response).to render_template :show 
    end

    it "assings the requested account to @account" do
    	get :show, id: account
    	expect(assigns(:account)).to eq account
    end

  end

end
