class UpdateKey < ActiveRecord::Migration[5.2]
  def change
    remove_column :antipodes, :antipode_forecasts_id
  end
end
