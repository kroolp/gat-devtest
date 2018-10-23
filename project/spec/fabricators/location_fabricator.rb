Fabricator(:location) do
  name 'Krakow'
  external_id { sequence(:code) { |i| "E#{i}" } }
  secret_code 'f526f639-8213-4953-879d-3aa6f4562810'

  location_group
end
