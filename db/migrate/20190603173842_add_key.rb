class AddKey < ActiveRecord::Migration[5.2]
  def change
    add_reference :antipodes, :antipode_forecast, foreign_key: true
  end
end
