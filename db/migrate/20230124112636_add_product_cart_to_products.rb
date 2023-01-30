class AddProductCartToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :product_cart, :string
  end
end
