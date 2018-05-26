class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :educations, :dependent => :destroy
  has_many :experiences, :dependent => :destroy
  has_many :skills, :dependent => :destroy
  has_many :user_languages, :dependent => :destroy
  has_many :applications, :dependent => :nullify
  has_many :jobs, through: :applications

  # VALIDATIONS

  has_attached_file :photo, styles: { normal: '864x1152#' }, convert_options: { normal: '-quality 50' }
	validates_attachment_size :photo, in: 0..3.megabytes, message: :exceeds_size
	validates_attachment_content_type :photo, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, message: :incorrect_format
	validates_numericality_of :phone_number, :only_integer => true, allow_blank: true, message: :only_number
	before_update :capitalize_fields, :validate_user_complete_update

	# METHODS

	def capitalize_fields
		if self.name != nil && self.surname != nil
			self.name = self.name.titleize
	    self.surname = self.surname.titleize
		end
	end

	def calculate_age
	  now = Time.now.utc.to_date
	  return now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
	end
	
	# Validation if User is complete

	def self.user_complete_validation(user)
		educations = user.educations.all.length
		experiences = user.experiences.all.length
		languages = user.user_languages.all.length
		skills = user.skills.all.length
		if 	user.name == nil || user.surname == nil || user.headline == nil || user.short_description == nil || user.phone_number == nil || user.birth_date == nil || user.name == "" || user.surname == "" || user.headline == "" || user.short_description == "" || user.phone_number == "" || user.birth_date == "" || educations < 1 || experiences < 1 || languages < 1 || skills < 1
			return false
		else
			return true
		end
	end

	def self.user_complete_validation_errors(user)
		educations = user.educations.all.length
		experiences = user.experiences.all.length
		languages = user.user_languages.all.length
		skills = user.skills.all.length
		errors = []
		if 	user.name == nil || user.name == ''
			errors.push('users.model.errors.name')
		end
		if 	user.surname == nil || user.surname == ''
			errors.push('users.model.errors.surname')
		end
		if 	user.headline == nil || user.headline == ''
			errors.push('users.model.errors.headline')
		end
		if 	user.short_description == nil || user.short_description == ''
			errors.push('users.model.errors.short_description')
		end
		if 	user.birth_date == nil || user.birth_date == ''
			errors.push('users.model.errors.birth_date')
		end
		if 	user.phone_number == nil || user.phone_number == ''
			errors.push('users.model.errors.phone_number')
		end
		if 	educations < 1
			errors.push('users.model.errors.educations')
		end
		if 	experiences < 1
			errors.push('users.model.errors.experiences')
		end
		if 	languages < 1
			errors.push('users.model.errors.languages')
		end
		if 	skills < 1
			errors.push('users.model.errors.skills')
		end

		return errors
	end

	# Assign user complete validation on User Model

	def validate_user_complete_update
		self.complete = User::user_complete_validation(self)
	end

	def self.validate_user_complete_errors(user)
		errors = User::user_complete_validation_errors(user)
		if errors.length > 0
			user.complete = false
		else
			user.complete = true
		end
		user.update(user.attributes)
		return errors
	end

	# Assign user complete validation on controller for objects associated / Educations / Experiences / Languages / Skills

	def self.validate_user_complete_and_save(user)
		user.complete = User::user_complete_validation(user)
		user.update(user.attributes)
	end

	def self.user_content_allowed?(user, current_user)
		user == current_user ? true : false
	end

	def self.user_admin_content_allowed?(current_user)
		current_user && current_user.admin ? true : false
	end


end
