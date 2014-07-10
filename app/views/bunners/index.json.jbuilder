json.array!(@bunners) do |bunner|
  json.extract! bunner, :id, :avatar
  json.url bunner_url(bunner, format: :json)
end
