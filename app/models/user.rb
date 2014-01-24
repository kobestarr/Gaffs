class User < ActiveRecord::Base

#what associations do they have?
has_many :gaffs
has_many :orders


# this is now built into rails 4
	


has_secure_password



#add in paperclip
has_attached_file :avatar, styles: {

	large: "320x320",
	medium: "140x140",
	thumbnail: "50x50"
}





# validations
validates :username, presence: true, uniqueness: true
validates :email, presence: true, uniqueness: true
validates :name, presence: true

end
