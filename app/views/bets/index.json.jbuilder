json.array!(@bets) do |bet|
  json.extract! bet, :id, :match_id, :player_id, :result
  json.url bet_url(bet, format: :json)
end
