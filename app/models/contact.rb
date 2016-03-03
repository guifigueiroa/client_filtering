class Contact < ActiveRecord::Base
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :age, numericality: { only_integer: true }
  validates :role, presence: true, length: { minimum: 5, maximum: 50 }
  validates :state, presence: true
end
