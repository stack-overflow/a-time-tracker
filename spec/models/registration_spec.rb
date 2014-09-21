require 'rails_helper'

RSpec.describe Registration, :type => :model do

  describe "Registration" do

		let(:registration_invalid) { Registration.new(first_name: 'Michal', last_name: 'Rudnik', email: 'abc', password: '12345678', password_confirmation: '12345678', name: 'MyCoolAccount', company: 'MyCoolCompany', terms_of_service: '1') }
		let(:registration_valid) { Registration.new(first_name: 'Michal', last_name: 'Rudnik', email: 'abc@abc.pl', password: '12345678', password_confirmation: '12345678', name: 'MyCoolAccount', company: 'MyCoolCompany', terms_of_service: '1') }
      
		it '#first_name' do
			expect(registration_valid.first_name).to eq('Michal')
		end

    it "should not allow to create invalid User" do
      expect(registration_invalid.save).to be_falsy
    end

    it "should create User" do
      expect { registration_valid.save }.to change(User, :count).by(1)
    end

    it "should create Account" do
      expect { registration_valid.save }.to change(Account, :count).by(1)
    end

    it 'should create Users\'s Account' do
    	registration_valid.save
    	expect(registration_valid.user.accounts).to eq [registration_valid.account]
    end

  end

end
