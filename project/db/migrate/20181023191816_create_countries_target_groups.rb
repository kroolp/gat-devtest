class CreateCountriesTargetGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :countries_target_groups do |t|
      t.belongs_to :target_group, null: false, foreign_key: true
      t.belongs_to :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
