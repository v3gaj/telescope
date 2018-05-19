class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language_level
  belongs_to :language

  # VALIDATIONS

  validates_uniqueness_of :language, scope: :user_id, :case_sensitive => false, message: :not_unique

	# METHODS

	def self.get_all_user_languages_from_user(user)
		return user.user_languages.all
	end

	# CONSTANTS

end
