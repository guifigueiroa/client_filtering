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
  
  def self.search(params)
    op_state = default_if_empty(params[:op_state], "AND")
    op_role = default_if_empty(params[:op_role], "AND")
    from = default_if_empty(params[:from], 0)
    to = default_if_empty(params[:to], 115)
    
    if params[:state].empty?
      Contact.where(["age BETWEEN #{from} AND #{to} #{op_role} role = :role", params])
    elsif params[:role].empty?
      Contact.where(["age BETWEEN #{from} AND #{to} #{op_state} state = :state", params])
    else
      Contact.where(["age BETWEEN #{from} AND #{to} #{op_state} state = :state #{op_role} role = :role", params])
    end
  end

  def self.default_if_empty(param, default)
    if param.empty?; default else param end
  end
end
