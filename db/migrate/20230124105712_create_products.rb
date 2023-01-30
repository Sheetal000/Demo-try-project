class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_title
      t.integer :product_prize

      t.timestamps
    end
  end
end
