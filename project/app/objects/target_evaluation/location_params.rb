module TargetEvaluation
  class LocationParams < ActiveType::Object
    attribute :id, :integer
    attribute :panel_size, :integer

    validates :id, presence: true
    validates :panel_size, presence: true
  end
end
