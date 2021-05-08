class CreateTipTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :tip_tag_relations do |t|
      t.references :tip, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
