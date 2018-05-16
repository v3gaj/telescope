class Experience < ApplicationRecord

  belongs_to :user

  # VALIDATIONS

	validates_presence_of :company, message: :not_blank
	validates_presence_of :position, message: :not_blank
	validates_presence_of :start_date, message: :not_blank
	validates_presence_of :end_date, message: :not_blank
	validates_presence_of :achievements, message: :not_blank
	validate :start_date_is_a_year, :end_year_equal_or_greater_start_year
	before_save :save_end_date

	def start_date_is_a_year
		years = (Experience::FORMSTARTYEAR..Time.now.year).to_a
		if !years.include?(self.start_date.to_i) && self.start_date != ""
			errors.add(:start_date, :incorrect_year)
		end
	end

	# Validation has end date field name included 
	def end_year_equal_or_greater_start_year
		years = (Experience::FORMSTARTYEAR..Time.now.year).to_a
		if years.include?(self.end_date.to_i) && self.end_date.to_i < self.start_date.to_i
			errors.add(:end_date, :start_date_greater)
		end
	end

	def save_end_date
		years = (Experience::FORMSTARTYEAR..Time.now.year).to_a
		if !years.include?(self.end_date.to_i)
			write_attribute(:end_date, 9999)
		end
	end

	# METHODS

	def self.get_all_experiences_from_user(user)
		return user.experiences.all.order(end_date: :desc, start_date: :desc)
	end

	# CONSTANTS

	FORMSTARTYEAR = 1970

end