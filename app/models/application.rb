class Application < ApplicationRecord

  belongs_to :user
  belongs_to :job

  STATUSES = ['Created', 'Rejected', 'Considered', 'Elected', 'Hired']

	validates_inclusion_of :status, :in => STATUSES, :message => :incorrect_status

  # METHODS

  def self.user_already_applied(job, user)
  	Application.where(job: job, user: user).exists?
  end

  def self.return_application(job, user)
  	application = Application.where(user: user, job: job).first
  	return application.id
  end

end
