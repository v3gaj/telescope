class Schedule < ApplicationRecord

	has_many :jobs, :dependent => :restrict_with_error

	# VALIDATIONS

	validates_presence_of :title, message: :not_blank
	validates_uniqueness_of :title, :case_sensitive => false, message: :not_unique
	before_save :capitalize_fields

	def capitalize_fields
	  self.title.capitalize!
	end

	# GLOBALIZE
	
	translates :title
	
end
