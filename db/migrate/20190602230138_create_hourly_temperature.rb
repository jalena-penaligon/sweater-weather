class CreateHourlyTemperature < ActiveRecord::Migration[5.2]
  def change
    create_table :hourly_temperatures do |t|
      t.string :time
      t.string :icon
      t.float :temperature
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
