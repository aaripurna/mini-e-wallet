class User < ApplicationRecord
  has_secure_password

  validates_presence_of %i[username email password_digest]
  validates_uniqueness_of :email, case_insensitive: true
  validates_uniqueness_of :username, case_insensitive: true
  validates_format_of :username, with: /\A^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$\z/
  validates_format_of :email, with: /\A^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$\z/

  def self.find_for_authentication(login)
    where("LOWER(username) = LOWER(:value) OR LOWER(email) = LOWER(:value)", value: login).first
  end
end