class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # Mongoid supplies a timestamping module in Mongoid::Timestamps 
  # which can be included to get basic behavior 
  # for created_at and updated_at fields.
  #include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email, default: ""
  field :encrypted_password, default: ""

  ## Recoverable
  field :reset_password_token
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip
  field :last_sign_in_ip
  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
  field :name

  # Associations
  has_many :articles

  # Following method used to fix devise error when login
  def to_key
    if key = super
      key = key.map(&:to_s)
    end
    key
  end
end
