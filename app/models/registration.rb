class Registration
  include ActiveModel::Model

  attr_reader :user, :account

  attr_accessor :first_name, :last_name, :company, :email, :password, :password_confirmation, :name, :terms_of_service

  validates :first_name, :last_name, :company, :email, :name, :password, :password_confirmation, presence: true
  validates :terms_of_service, acceptance: true


  def prepare_user
    @user = User.new(
        first_name: first_name, 
        last_name: last_name,
        email: email,
        password: password, 
        password_confirmation: password_confirmation)
  end


  def perform
    ua = UserAccount.new(user: user, account: account)
    @user.save!
    @account.save!
    ua.save!
  end

  def save
  	prepare_user
    prepare_account
    valid? && perform
  end

  def valid?
    (super && user.valid? && account.valid?).tap do |value|
      delegate_errors_for_user
      delegate_errors_for_account
    end
  end
  
  private
  
  def prepare_account
    @account = Account.new(company: company, name: name)
  end

  def delegate_errors_for_user
    errors.add(:first_name, @user.errors[:first_name].first) if @user.errors[:first_name].present?
    errors.add(:last_name, @user.errors[:last_name].first) if @user.errors[:last_name].present?
    errors.add(:email, @user.errors[:email].first) if @user.errors[:email].present?
    errors.add(:password, @user.errors[:password].first) if @user.errors[:password].present?
    errors.add(:password_confirmation, @user.errors[:password_confirmation].first) if @user.errors[:password_confirmation].present?
  end

  def delegate_errors_for_account
    errors.add(:company, @account.errors[:company].first) if @account.errors[:company].present?
  end

end