class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :soft_deleted, default: false
      t.date :deleted_at

      t.timestamps
    end
  end
end
