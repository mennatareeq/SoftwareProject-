json.array!(@logs) do |log|
  json.extract! log, :id, :first_name, :last_name, :email
  json.url log_url(log, format: :json)
end
