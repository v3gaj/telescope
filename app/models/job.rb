class Job < ApplicationRecord
  belongs_to :language
  belongs_to :industry
  belongs_to :employment
  belongs_to :schedule
  has_many :applications, :dependent => :restrict_with_error

  STATUSES = ['Open', 'Completed', 'Positioned', 'Closed']

	validates_inclusion_of :status, :in => STATUSES, :message => :incorrect_status

end
