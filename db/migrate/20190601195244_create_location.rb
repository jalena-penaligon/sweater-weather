class CreateLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city_state
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
