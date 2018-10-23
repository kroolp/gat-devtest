Fabricator(:panel_provider) do
  code { sequence(:code) { |i| "C#{i}" } }
end
