class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
     
      t.string :name
      t.string :facebookUrl
      t.string :instagramUrl
      t.string :linkedinUrl
      t.string :description
      t.datetime :deletedAt
      t.integer :deleted
      t.timestamps
    end
  end
end
