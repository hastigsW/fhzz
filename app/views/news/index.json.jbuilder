json.array!(@news) do |news|
  json.extract! news, :id, :title, :image, :url, :content
  json.url news_url(news, format: :json)
end
