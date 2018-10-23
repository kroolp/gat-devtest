class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :external_id, :location_group_id

  attribute :secret_code, if: -> { instance_options[:secret_attributes] }
end
