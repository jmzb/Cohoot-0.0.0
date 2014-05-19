json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :content, :tstmp
  json.url campaign_url(campaign, format: :json)
end
