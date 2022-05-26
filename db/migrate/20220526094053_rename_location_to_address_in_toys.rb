class RenameLocationToAddressInToys < ActiveRecord::Migration[7.0]
  def change
    rename_column :toys, :location, :address
  end
end
