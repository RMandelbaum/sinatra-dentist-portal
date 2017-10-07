class Patient < ActiveRecord::Base
  has_secure_password

  belongs_to :doctor
  has_many :forms

  validates :username, presence: true

  def slug
    username.downcase.gsub(" ","-")
  end

 def self.find_by_slug(slug)
   Patient.all.find{|patient| patient.slug == slug}
 end

 end
