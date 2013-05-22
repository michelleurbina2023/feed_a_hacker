class Hacker < ActiveRecord::Base
  attr_accessible :address, :current_projects, :email, :first_name, :git_url, :avatar_url, :last_name, :objectives, :password_confirmation, :password, :portfolio_url, :stack, :twitter_url

  has_many :payments

  attr_accessor :password
  before_save :encrypt_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_uniqueness_of :email, :allow_blank => true
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  def self.authenticate(email, password)
    hacker = find_by_email(email)
    if hacker && hacker.password_hash == BCrypt::Engine.hash_secret(password, hacker.password_salt)
      hacker
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, self.password_salt)
    end
  end
end