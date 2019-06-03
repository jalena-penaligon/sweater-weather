class AddAntipodeForecastToAntipode < ActiveRecord::Migration[5.2]
  def change
    add_reference :antipodes, :antipode_forecasts, foreign_key: true
  end
end
