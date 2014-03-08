class User < ActiveRecord::Base
  has_many :notes
  before_create :create_remember_token


  # Find a user by given email and authenticate against given password.
  # Return the user if found and authenticated.
  # Return nil if the user is not found.
  # Return nil if the user is found but cannot be authenticated.
  def self.authenticate(name, password)
    user = find_by(name: name)
    user && user.authenticate(password) ? user : nil
  end


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end

end
