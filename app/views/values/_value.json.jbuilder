json.extract! value, :id, :title, :description, :image, :created_at, :updated_at
json.url value_url(value, format: :json)
