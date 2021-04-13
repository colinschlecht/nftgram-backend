class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.references :art, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
