class User < ApplicationRecord

  has_many :shortners, dependent: :destroy

  validates :username,
            presence: true,
            uniqueness: {case_sensitive: false}

  before_save :create_auth_token

  def create_auth_token
    self.auth_token = Digest::MD5.hexdigest(username)
  end
end
