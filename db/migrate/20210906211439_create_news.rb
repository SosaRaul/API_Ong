class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :name, unique: true   #consultar por t.unique: name
      t.text :content
      t.boolean :softDelets
      t.integer :categoryId

      t.timestamps
    end
  end
end
