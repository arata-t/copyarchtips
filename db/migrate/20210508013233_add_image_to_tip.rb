class AddImageToTip < ActiveRecord::Migration[6.0]
  def change
    add_column :tips, :image, :string
  end
end
