class AddFullSummaryToCurrentTemperature < ActiveRecord::Migration[5.2]
  def change
    add_column :current_temperatures, :full_summary, :string
  end
end
