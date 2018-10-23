class TargetGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :external_id, :parent_id, :panel_provider_id

  attribute :secret_code, if: -> { instance_options[:secret_attributes] }
end
