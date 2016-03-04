class Filter < ActiveRecord::Base
  validates :filter_name, presence: true
end
