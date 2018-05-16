class Job < ApplicationRecord
  belongs_to :language
  belongs_to :industry
  belongs_to :employment
  belongs_to :schedule
end
