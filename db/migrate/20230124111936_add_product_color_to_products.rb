class AddProductColorToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :product_color, :string
  end
end
