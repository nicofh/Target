class AddLatitudeAndLongitudeToTargets < ActiveRecord::Migration[5.1]
  def change
    add_column :targets, :latitude, :decimal
    add_column :targets, :longitude, :decimal
  end
end
