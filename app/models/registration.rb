class Registration
  include ActiveModel::Model

  attr_reader :user
  attr_reader :account

  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :company
  attr_accessor :email
  attr_accessor :password
  attr_accessor :name
  attr_accessor :terms_of_service

  validates :first_name, :last_name, :company, :email, :name, :password, presence: true
  validates :terms_of_service, acceptance: true

  def save
  	if valid?
    	@user = User.new(
    		first_name: first_name, 
    		last_name: last_name,
    		email: email,
    		password: password)

    	@account = Account.new(company: company, name: name)

    	delegate_errors_for_user
    	delegate_errors_for_account

    	if !errors.any?
    		ua = UserAccount.new(user: @user, account: @account)
    		@user.save
    		@account.save
    		ua.save
    	else
    		false
    	end
  	end
  end

  def delegate_errors_for_user
    errors.add(:first_name, @user.errors[:first_name].first) if @user.errors[:first_name].present?
    errors.add(:last_name, @user.errors[:last_name].first) if @user.errors[:last_name].present?
    errors.add(:email, @user.errors[:email].first) if @user.errors[:email].present?
    errors.add(:password, @user.errors[:password].first) if @user.errors[:password].present?
  end

  def delegate_errors_for_account
    errors.add(:company, @account.errors[:company].first) if @account.errors[:company].present?
  end

end