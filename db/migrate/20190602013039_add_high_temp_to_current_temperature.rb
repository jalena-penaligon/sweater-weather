class AddHighTempToCurrentTemperature < ActiveRecord::Migration[5.2]
  def change
    add_column :current_temperatures, :high_temp, :float
    add_column :current_temperatures, :low_temp, :float
  end
end
