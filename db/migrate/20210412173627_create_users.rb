class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :metamask_account
      t.string :username
      t.string :bio
      t.string :avatar

      t.timestamps
    end
  end
end
