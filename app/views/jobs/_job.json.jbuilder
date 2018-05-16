json.extract! job, :id, :job_title, :job_description, :requirements, :preferred, :language_id, :industry_id, :employment_id, :schedule_id, :province, :other_signs, :created_at, :updated_at
json.url job_url(job, format: :json)
