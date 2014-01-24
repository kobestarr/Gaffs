class Gaff < ActiveRecord::Base

	#associations
	belongs_to :user
	has_many :orders	

	#this is info from the ruby geocoder.org site
	geocoded_by :address
	after_validation :geocode

	#add some validations
	validates :title, presence: true
	validates :address, presence: true
	validates :price, presence: true,
		numericality: {greater_than_or_equal_to: 0.5} # this is because the min payment is 50 pence

	#add in paperclip to save values
	#if we wanted it to be a certain height "x500"
	#if we wanted it to be a certain width "500x"
	has_attached_file :image, styles:{large: "960x300#", 
			thumbnail: "50x50#"}	


end
