class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
      t.text :description
      t.string :name
      t.integer :cuteness
      t.boolean :kid_friendly
      t.integer :price_daily
      t.string :location
      t.integer :soul_taking_chance

      t.timestamps
    end
  end
end
