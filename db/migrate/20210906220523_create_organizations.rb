class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :address
      t.integer :phone
      t.string :email, null: false
      t.text :welcomeText, null:false
      t.text :aboutUsText
      t.boolean :organizationDelete

      t.timestamps
    end
    end
end
