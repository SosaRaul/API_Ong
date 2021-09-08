class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstName, null: false
      t.string :lastName, null: false
      t.string :email, uniqueness: true, null: false
      t.string :password_digest, null: false
      t.string :photo
      t.boolean :soft_deleted, default: false
      t.date :deleted_at
      t.belongs_to :role     

      t.timestamps
    end
  end
end
