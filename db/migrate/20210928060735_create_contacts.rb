class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.text :message
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
