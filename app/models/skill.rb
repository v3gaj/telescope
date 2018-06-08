class Skill < ApplicationRecord

	belongs_to :user

  # VALIDATIONS

	validates_presence_of :skill, message: :not_blank
	validates_presence_of :knowledge_percentage, message: :not_blank
	validates_uniqueness_of :skill, scope: :user_id, :case_sensitive => false, message: :not_unique
	validate :knowledge_percentage_valid_value
	validate :max_skills, :on => :create

	# Validation percentage value 
	def knowledge_percentage_valid_value
		if ( self.knowledge_percentage.to_i <= 0 || self.knowledge_percentage.to_i > 100 ) && self.knowledge_percentage != nil
			errors.add(:knowledge_percentage, :incorrect_percentage)
		end
	end

	# Validation percentage value 
	def max_skills
		user = User.find(self.user_id)
		if user.skills.all.count >= 10
			errors.add(:base, :max_skills_reached)
		end
	end

	# METHODS

	def self.get_all_skills_from_user(user)
		return user.skills.all
	end

end
