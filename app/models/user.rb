require 'bcrypt'


class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id,       Serial
  property :name,     Text
  property :email,    Text
  property :username, Text
  property :password_digest, Text

  has n, :peeps, :through => Resource


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  # def self.authenticate(email, password)
  #   user = first(:email => email)
  #   if user && BCrypt::Password.new(user.password_digest) == password
  #     user
  #   else
  #     nil 
  #   end 
  # end 

end