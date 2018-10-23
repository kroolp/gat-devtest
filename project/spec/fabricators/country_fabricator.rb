Fabricator(:country) do
  code { sequence(:code) { |i| "C#{i}" } }
  panel_provider
end
