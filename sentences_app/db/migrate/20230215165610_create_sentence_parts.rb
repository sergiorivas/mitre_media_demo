class CreateSentenceParts < ActiveRecord::Migration[7.0]
  def change
    create_table :sentence_parts do |t|
      t.string :text
      t.integer :order
      t.belongs_to :sentence, index: true
      t.belongs_to :entity_type, null: true
      t.timestamps
    end
  end
end
