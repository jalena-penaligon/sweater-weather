class AddBackgroundImageToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :background_image, :string
  end
end
