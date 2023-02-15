class CreateEntityTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_types do |t|
      t.string :name, unique: true, null: false
      t.string :color

      t.timestamps
    end
  end
end
