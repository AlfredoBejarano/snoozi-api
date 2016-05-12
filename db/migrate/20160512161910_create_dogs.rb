class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :breed
      t.string :color
      t.boolean :gender
      t.string :found_location
      t.date :found_date
      t.text :description
      t.string :number

      t.timestamps null: false
    end
  end
end
