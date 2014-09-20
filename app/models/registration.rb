class Registration
  include ActiveModel::Model
  #include ActiveModel::Conversion
  #include ActiveModel::Validations

  attr_reader :user
  attr_reader :account

  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :company
  attr_accessor :email
  attr_accessor :password

  validates :first_name, :last_name, :company, :email, :password, presence: true

  def save
    @user = User.create(
    	first_name: first_name, 
    	last_name: last_name,
    	email: email,
    	password: password)

    @account = Account.create(company: company)
    ua = UserAccount.create(user: @user, account: @account)

  end

end