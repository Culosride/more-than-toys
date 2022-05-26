class AddCoordinatesToToys < ActiveRecord::Migration[7.0]
  def change
    add_column :toys, :latitude, :float
    add_column :toys, :longitude, :float
  end
end
