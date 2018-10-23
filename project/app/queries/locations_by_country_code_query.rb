class LocationsByCountryCodeQuery
  attr_reader :country, :relation

  def initialize(country, relation = Location.all)
    @country = country
    @relation = relation
  end

  def all
    relation.joins(location_group: { country: :panel_provider })
            .where(countries: { code: country })
            .order(created_at: :desc)
  end
end
