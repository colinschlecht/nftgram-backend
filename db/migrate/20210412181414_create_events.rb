class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :art, null: false, foreign_key: true
      t.string :event

      t.timestamps
    end
  end
end
