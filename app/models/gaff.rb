class Gaff < ActiveRecord::Base

	#this is info from the ruby geocoder.org site
	geocoded_by :address
	after_validation :geocode

	#add some validations
	validates :title, presence: true
	validates :address, presence: true
	validates :price, presence: true,
		numericality: {greater_than_or_equal_to: 0.5} # this is because the min payment is 50 pence



end
