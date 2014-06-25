json.array!(@items) do |item|
  json.extract! item, :id, :item_type_id, :name, :sub_title, :image_url, :url, :desc
  json.url item_url(item, format: :json)
end
