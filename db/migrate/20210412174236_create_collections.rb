class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
