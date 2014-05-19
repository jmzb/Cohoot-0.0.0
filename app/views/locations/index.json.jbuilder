json.array!(@locations) do |location|
  json.extract! location, :id, :loc_name, :loc_street, :loc_city, :loc_state, :loc_zip
  json.url location_url(location, format: :json)
end
