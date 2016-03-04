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
    state = params[:state]
    op_role = default_if_empty(params[:op_role], "AND")
    role = params[:role]
    from = default_if_empty(params[:age_from], 0)
    to = default_if_empty(params[:age_to], 115)
    
    search_params(from, to, op_state, state, op_role, role)
  end
  
  def self.search_by_filter(filter)
    @filter = Filter.find(filter)
    @filter.age_from ||= 0
    @filter.age_to ||= 115
    @filter.op_state ||= "AND"
    @filter.op_role ||= "AND"
    search_params(@filter.age_from, @filter.age_to, @filter.op_state, @filter.state, @filter.op_role, @filter.role)
  end

  private
  
  def self.search_params(from, to, op_state, state, op_role, role)
    age_filter = "age BETWEEN #{from} AND #{to}"
    if state.empty? && role.empty?
      Contact.where(age_filter)
    elsif state.empty?
      Contact.where("#{age_filter} #{op_role} role = '#{role}'")
    elsif role.empty?
      Contact.where("#{age_filter} #{op_state} state = '#{state}'")
    else
      Contact.where("#{age_filter} #{op_state} state = '#{state}' #{op_role} role = '#{role}'")
    end
  end
  
  def self.default_if_empty(param, default)
    if param.nil? || param.empty?; default else param end
  end
end
