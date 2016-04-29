json.array!(@matches) do |match|
  json.extract! match, :id, :host_name, :guest_name, :result, :date
  json.url match_url(match, format: :json)
end
