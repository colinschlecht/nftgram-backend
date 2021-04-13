class CreateArts < ActiveRecord::Migration[6.1]
  def change
    create_table :arts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.boolean :for_sale
      t.integer :likes
      t.string :slug
      t.string :description
      t.string :caption
      t.float :value
      t.string :link

      t.timestamps
    end
  end
end
