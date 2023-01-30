class RemoveProductColorFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :product_color, :string
  end
end
