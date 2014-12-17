json.array!(@articles) do |article|
  json.extract! article, :id, :name, :message
  json.url article_url(article, format: :json)
end
