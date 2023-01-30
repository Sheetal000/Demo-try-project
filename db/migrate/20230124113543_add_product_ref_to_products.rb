class AddProductRefToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :product, null: false, foreign_key: true
  end
end
