class TargetGroupsByCountryCodeQuery
  attr_reader :country, :relation

  def initialize(country, relation = TargetGroup.all)
    @country = country
    @relation = relation
  end

  def all
    relation.joins(countries: :panel_provider)
            .where(countries: { code: country })
            .order(created_at: :desc)
  end
end
