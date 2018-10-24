module TargetEvaluation
  class Params < ActiveType::Object
    attribute :country_code, :string
    attribute :target_group_id, :integer
    attribute :locations

    validates :country_code, presence: true, format: { with: /[A-Z]{2}/ }
    validates :target_group_id, presence: true
    validates :locations, presence: true
    validate :validate_locations

    private

    def validate_locations
      locations_params.each do |location_params|
        if location_params.invalid?
          errors.add(:locations, location_params.errors.to_h)
          break
        end
      end
    end

    def locations_params
      @locations_params ||= locations.to_a.map { |location| LocationParams.new(location) }
    end
  end
end
