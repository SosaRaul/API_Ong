class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :content
      t.datetime :deletedAt
      t.integer :deleted
      t.timestamps
    end
  end
end
