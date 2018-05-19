class Degree < ApplicationRecord

	has_many :educations, :dependent => :restrict_with_error

	# VALIDATIONS

	validates_presence_of :title, message: :not_blank
	validates_uniqueness_of :title, :case_sensitive => false, message: :not_unique
	validates_presence_of :color, message: :not_blank
	before_save :capitalize_fields

	def capitalize_fields
	  self.title.capitalize!
	end

	# GLOBALIZE
	
	translates :title

end
