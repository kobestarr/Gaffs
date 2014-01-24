class User < ActiveRecord::Base

#what associations do they have?
has_many :gaffs


# this is now built into rails 4


has_secure_password

# validations
validates :username, presence: true, uniqueness: true
validates :email, presence: true, uniqueness: true
validates :name, presence: true

end
