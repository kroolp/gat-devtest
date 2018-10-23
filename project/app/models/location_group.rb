class LocationGroup < ApplicationRecord
  belongs_to :country
  belongs_to :panel_provider
  has_many :locations

  validates :name, presence: true
  validates :country, presence: true
  validates :panel_provider, presence: true
end
