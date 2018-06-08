class Education < ApplicationRecord
  
  belongs_to :degree
  belongs_to :user

  # VALIDATIONS

	validates_presence_of :study_field, message: :not_blank
	validates_presence_of :institution, message: :not_blank
	validates_presence_of :start_date, message: :not_blank
	validates_presence_of :end_date, message: :not_blank
	validate :start_date_is_a_year, :end_year_equal_or_greater_start_year, :validate_description_not_blank
	before_save :save_end_date

	def validate_description_not_blank
		years = (Education::FORMSTARTYEAR..Time.now.year).to_a
		if !years.include?(self.end_date.to_i)
			if self.description == nil || self.description == ""
				errors.add(:description, :not_blank)
			end
		end
	end

	def start_date_is_a_year
		years = (Education::FORMSTARTYEAR..Time.now.year).to_a
		if !years.include?(self.start_date.to_i) && self.start_date != ""
			errors.add(:start_date, :incorrect_year)
		end
	end

	# Validation has end date field name included 
	def end_year_equal_or_greater_start_year
		years = (Education::FORMSTARTYEAR..Time.now.year).to_a
		if years.include?(self.end_date.to_i) && self.end_date.to_i < self.start_date.to_i
			errors.add(:end_date, :start_date_greater)
		end
	end

	def save_end_date
		years = (Education::FORMSTARTYEAR..Time.now.year).to_a
		if !years.include?(self.end_date.to_i)
			write_attribute(:end_date, 0)
		end
	end

	# METHODS

	def self.get_all_educations_from_user(user)
		return user.educations.all.order(end_date: :desc, start_date: :desc)
	end

	# CONSTANTS

	FORMSTARTYEAR = 1970

end