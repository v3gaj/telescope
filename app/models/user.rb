class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :educations, :dependent => :destroy
  has_many :experiences, :dependent => :destroy
  has_many :skills, :dependent => :destroy
  has_many :user_languages, :dependent => :destroy

  # VALIDATIONS

  has_attached_file :photo, styles: { normal: '864x1152#' }, convert_options: { normal: '-quality 50' }
	validates_attachment_size :photo, in: 0..3.megabytes, message: :exceeds_size
	validates_attachment_content_type :photo, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, message: :incorrect_format
	validates_numericality_of :phone_number, :only_integer => true, allow_blank: true, message: :only_number
	before_update :capitalize_fields

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

	def self.user_content_allowed?(user, current_user)
		user == current_user ? true : false
	end
end
