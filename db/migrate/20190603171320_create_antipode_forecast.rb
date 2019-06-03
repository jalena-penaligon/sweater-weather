class CreateAntipodeForecast < ActiveRecord::Migration[5.2]
  def change
    create_table :antipode_forecasts do |t|
      t.string :summary
      t.float :current_temperature
      t.references :antipode, foreign_key: true
    end
  end
end
