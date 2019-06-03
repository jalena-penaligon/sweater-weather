class RemoveColumnFromAntipodeForecast < ActiveRecord::Migration[5.2]
  def change
    remove_column :antipode_forecasts, :antipode_id
  end
end
