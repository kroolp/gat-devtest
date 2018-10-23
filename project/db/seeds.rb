PANEL_PROVIDERS_CODES = %w[times_a 10_arrays times_html].freeze

COUNTRIES = [
  { code: "PL", panel_provider_code: "times_a" },
  { code: "US", panel_provider_code: "10_arrays" },
  { code: "UK", panel_provider_code: "times_html" }
].freeze

LOCATION_GROUPS = [
  { name: "Coast of the Pacific Ocean", country_code: "US", panel_provider_code: "times_a" },
  { name: "Coast of the Gulf of Mexico", country_code: "US", panel_provider_code: "10_arrays" },
  { name: "Podhale", country_code: "PL", panel_provider_code: "times_html" },
  { name: "Kharkiv Oblast", country_code: "UK", panel_provider_code: "times_a" }
].freeze

LOCATIONS = [
  { name: "New York", location_group_name: "Coast of the Pacific Ocean" },
  { name: "Los Angeles", location_group_name: "Coast of the Gulf of Mexico" },
  { name: "Chicago", location_group_name: "Coast of the Pacific Ocean" },
  { name: "Houston", location_group_name: "Coast of the Pacific Ocean" },
  { name: "Philadelphia", location_group_name: "Podhale" },
  { name: "Phoenix", location_group_name: "Coast of the Gulf of Mexico" },
  { name: "San Antonio", location_group_name: "Coast of the Pacific Ocean" },
  { name: "San Diego", location_group_name: "Podhale" },
  { name: "Dallas", location_group_name: "Coast of the Pacific Ocean" },
  { name: "San Jose", location_group_name: "Kharkiv Oblast" },
  { name: "Austin", location_group_name: "Coast of the Pacific Ocean" },
  { name: "Jacksonville", location_group_name: "Kharkiv Oblast" },
  { name: "San Francisco", location_group_name: "Coast of the Pacific Ocean" },
  { name: "Indianapolis", location_group_name: "Coast of the Pacific Ocean" },
  { name: "Columbus", location_group_name: "Podhale" },
  { name: "Fort Worth", location_group_name: "Coast of the Gulf of Mexico" },
  { name: "Charlotte", location_group_name: "Kharkiv Oblast" },
  { name: "Detroit", location_group_name: "Coast of the Gulf of Mexico" },
  { name: "El Paso", location_group_name: "Podhale" },
  { name: "Seattle", location_group_name: "Coast of the Pacific Ocean" }
].freeze

TARGET_GROUPS = [
  {
    name: "Women",
    panel_provider_code: "times_html",
    parent_name: nil,
    country_codes: %w[US]
  },
  {
    name: "Men",
    panel_provider_code: "10_arrays",
    parent_name: nil,
    country_codes: %w[US UK]
  },
  {
    name: "Children",
    panel_provider_code: "times_a",
    parent_name: nil,
    country_codes: %w[UK]
  },
  {
    name: "Sportsmen",
    panel_provider_code: "10_arrays",
    parent_name: nil,
    country_codes: %w[US]
  },
  {
    name: "Moms",
    panel_provider_code: "times_html",
    parent_name: "Women"
  },
  {
    name: "Pregnant",
    panel_provider_code: "times_a",
    parent_name: "Moms"
  },
  {
    name: "Breastfeeding",
    panel_provider_code: "times_html",
    parent_name: "Moms"
  },
  {
    name: "Motorists",
    panel_provider_code: "10_arrays",
    parent_name: "Men"
  },
  {
    name: "Car drivers",
    panel_provider_code: "times_html",
    parent_name: "Motorists"
  },
  {
    name: "Boys",
    panel_provider_code: "times_html",
    parent_name: "Children"
  },
  {
    name: "Players",
    panel_provider_code: "times_a",
    parent_name: "Boys"
  },
  {
    name: "Footballers",
    panel_provider_code: "times_html",
    parent_name: "Sportsmen"
  },
  {
    name: "Professionals",
    panel_provider_code: "10_arrays",
    parent_name: "Footballers"
  },
  {
    name: "Amateurs",
    panel_provider_code: "times_html",
    parent_name: "Footballers"
  }
].freeze

USERS = [
  {
    email: 'alex@example.com',
    password: '0ksymoroN'
  },
  {
    email: 'john@example.com',
    password: 'john12345'
  }
].freeze

PANEL_PROVIDERS_CODES.each { |panel_provider_code| PanelProvider.create!(code: panel_provider_code) }

COUNTRIES.each do |country|
  Country.create!(
    code: country.fetch(:code),
    panel_provider: PanelProvider.find_by!(code: country.fetch(:panel_provider_code))
  )
end

LOCATION_GROUPS.each do |location_group|
  LocationGroup.create!(
    name: location_group.fetch(:name),
    panel_provider: PanelProvider.find_by(code: location_group.fetch(:panel_provider_code)),
    country: Country.find_by(code: location_group.fetch(:country_code))
  )
end

LOCATIONS.each do |location|
  Location.create!(
    name: location.fetch(:name),
    external_id: SecureRandom.uuid,
    secret_code: SecureRandom.hex(64),
    location_group: LocationGroup.find_by(name: location.fetch(:location_group_name))
  )
end

TARGET_GROUPS.each do |target_group|
  countries = target_group.fetch(:country_codes, []).map do |country_code|
    Country.find_by(code: country_code)
  end

  TargetGroup.create!(
    name: target_group.fetch(:name),
    external_id: SecureRandom.uuid,
    secret_code: SecureRandom.hex(64),
    parent: TargetGroup.find_by(name: target_group.fetch(:parent_name)),
    panel_provider: PanelProvider.find_by(code: target_group.fetch(:panel_provider_code)),
    countries: countries
  )
end

USERS.each do |user|
  User.create!(
    email: user.fetch(:email),
    password: user.fetch(:password)
  )
end
