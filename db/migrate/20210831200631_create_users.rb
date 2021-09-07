class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstName, null: false
      t.string :lastName, null: false
      t.string :email, uniqueness: true, null: false
      t.string :password, null: false
      t.string :photo
      t.boolean :soft_deleted, default: false
      t.date :deleted_at
      #t.belongs_to :role, foreign_key: true           ver con el equipo

      t.timestamps
    end
  end
end
