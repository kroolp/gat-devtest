class CreateTargetGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :target_groups do |t|
      t.string :name, null: false
      t.string :external_id, null: false
      t.string :secret_code, null: false

      t.belongs_to :parent, foreign_key: { to_table: :target_groups }, optional: true
      t.belongs_to :panel_provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
