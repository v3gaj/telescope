json.extract! slide, :id, :title, :subtitle, :url, :background, :created_at, :updated_at
json.url slide_url(slide, format: :json)
