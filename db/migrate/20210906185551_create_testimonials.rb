class CreateTestimonials < ActiveRecord::Migration[6.1]
  def change
    create_table :testimonials do |t|
      t.unique :name
      t.text :content
      t.boolean :softDelets

      t.timestamps
    end
  end
end
