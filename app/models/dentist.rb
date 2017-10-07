class Dentist < ActiveRecord::Base
  has_many :patients
  
end
