class CreateWeeklyTemperature < ActiveRecord::Migration[5.2]
  def change
    create_table :weekly_temperatures do |t|
      t.references :location, foreign_key: true
      t.string :time
      t.float :chance_precip
      t.string :icon
      t.float :high_temp
      t.float :low_temp
    end
  end
end
