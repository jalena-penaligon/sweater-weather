class CreateCurrentTemperature < ActiveRecord::Migration[5.2]
  def change
    create_table :current_temperatures do |t|
      t.float :temperature
      t.string :summary
      t.string :icon
      t.float :feels_like
      t.float :humidity
      t.float :visibility
      t.integer :uvindex
      t.references :location, index: true, foreign_key: true

      t.timestamps
    end
  end
end
